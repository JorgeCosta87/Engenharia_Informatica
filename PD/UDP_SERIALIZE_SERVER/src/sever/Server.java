/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sever;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author Costa
 */
public class Server {

 
    public static final int port = 6001;
    

    public static void main(String[] args) {
        // TODO code application logic here
        
        String time;
        

        try{  
                    DatagramSocket s = new DatagramSocket(port);
            while(true)
            {
                
               //TRANSMIT OBJECT
                System.out.println("New socket created");

               byte[] recbuf = new byte[4096];
               DatagramPacket receivePacket=new DatagramPacket(recbuf,4096);

               s.receive(receivePacket);

               ObjectInputStream in = new ObjectInputStream(new ByteArrayInputStream(receivePacket.getData(), 0, receivePacket.getLength()));

               time = (String)in.readObject();


               System.out.println("Message received: " + time);
               
               if(time.equals("TIME"))
               {
                   
                    Calendar calendar = new  GregorianCalendar();
                            
                    ByteArrayOutputStream bOut = new ByteArrayOutputStream();
                    ObjectOutputStream out = new ObjectOutputStream(bOut);
                    out.writeObject(calendar);

                    out.flush();
                    DatagramPacket packet = new DatagramPacket(bOut.toByteArray(), bOut.size(), receivePacket.getAddress(), receivePacket.getPort());
                    s.send(packet);
               }






            }

        }catch(Exception e)
        {
            e.printStackTrace();
        }

        
        
    }
    
}
