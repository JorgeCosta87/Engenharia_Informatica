/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import static java.lang.System.out;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Calendar;


public class Client {

    
    public static final int port = 6001;
    

    public static void main(String[] args) {
        // TODO code application logic here
        
        String time = "TIME";
        
       
        String hostname = "127.0.0.1";
        
        hostname = args[0].toString();
        
        // GET AN INETADDRESS FOR THE SPECIFIED HOSTNAME
        InetAddress addr = null;
        
        try{

            addr = InetAddress.getByName(hostname);
        }catch (UnknownHostException e){
            System.err.println ("Unable to resolve host");
            return;
        }
        
        try{  
            
            DatagramSocket s = new DatagramSocket();
            //TRANSMIT OBJECT


            ByteArrayOutputStream bOut = new ByteArrayOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(bOut);
            out.writeObject(time);

            out.flush();
            DatagramPacket packet = new DatagramPacket(bOut.toByteArray(), bOut.size(), addr, port);
            s.send(packet);

            
            Calendar calendar;
            
            byte[] recbuf = new byte[4096];
            DatagramPacket receivePacket=new DatagramPacket(recbuf,4096);

            boolean timeout = false;

            s.receive(receivePacket);
           
            ObjectInputStream in = new ObjectInputStream(new ByteArrayInputStream(receivePacket.getData(), 0, receivePacket.getLength()));
            
            calendar = (Calendar)in.readObject();
            
            
            System.out.println("Calender: " + calendar.getTime());

        }catch(Exception e)
        {
            e.printStackTrace();
        }

        
        
    }
    
}
