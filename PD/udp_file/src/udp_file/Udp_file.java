/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package udp_file;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 *
 * @author Costa
 */
public class Udp_file {

    // UDP PORT TO WHICH SERVICE IS BOUND
    public static final int SERVICE_PORT = 5001;
    // MAX SIZE OF PACKET
    public static final int BUFSIZE = 40000;
    
    public static String filename = "Foto1.jpg";
    
    
    public static void main(String[] args) {
        
       
        String hostname = "10.65.132.252";
        // GET AN INETADDRESS FOR THE SPECIFIED HOSTNAME
        InetAddress addr = null;
        try{
        // RESOLVE THE HOSTNAME TO AN INETADDR
            addr = InetAddress.getByName(hostname);
        }catch (UnknownHostException e){
            System.err.println ("Unable to resolve host");
        return;
    }
        
        try {
        // BIND TO ANY FREE PORT
            DatagramSocket socket = new DatagramSocket();
        // SET A TIMEOUT VALUE OF TWO SECONDS
            socket.setSoTimeout (2 * 1000);
            // CREATE A PACKET TO SEND TO THE UDP SERVER
            
            String message = filename;

            FileOutputStream out = new FileOutputStream(filename);
            
            DatagramPacket sendPacket = new DatagramPacket(message.getBytes(),message.length(), addr, SERVICE_PORT);
            System.out.println ("Sending packet to " + hostname);
            // SEND THE PACKET
            socket.send (sendPacket);
            System.out.print ("receiving file.... \n");
            
            // CREATE A SMALL PACKET FOR RECEIVING UDP PACKETS
            
            byte[] recbuf = new byte[BUFSIZE];
            DatagramPacket receivePacket=new DatagramPacket(recbuf,BUFSIZE);
            
            for(;;)
            {
                boolean timeout = false;
                try {
                    socket.receive (receivePacket);
                }catch (InterruptedIOException e){
                    timeout = true;
                }
                
                if(receivePacket.getLength() <= 0)
                    break;

                if (!timeout)
                {  
                    out.write(receivePacket.getData(),0,receivePacket.getLength());
                    System.out.println ("packet received!" + receivePacket.getAddress() + "size: " + receivePacket.getLength());
                
                }else{ // TIMEOUT HAS OCCURED
                    System.out.println ("packet lost!");
                }
            }
        }catch (IOException e){
            System.err.println ("Socket error " + e);
        }
    }
    
}
