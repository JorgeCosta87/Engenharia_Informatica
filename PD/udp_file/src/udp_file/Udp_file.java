/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package udp_file;

import java.io.ByteArrayInputStream;
import java.io.File;
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
        
        //Integer.parseInt(args[0]);
        
        String fileName = args[2].trim();
        File loadDirector = new File(args[3].trim());
        
        if(!loadDirector.exists())
        {
            return;
        }
        
        if(!loadDirector.isDirectory())
        {
            return;
        }
        
        if(!loadDirector.canWrite())
        {
            return;
        }
        
        try
        {
            //cannocail give us  the path till the place we are.
            String localFilePath = loadDirector.getCanonicalPath() + File.separator + fileName;
            FileOutputStream localFileOutputStream = new FileOutputStream(localFilePath);
            
        }catch(IOException e)
        {
            
            
        }
        
        
       
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
            String message = filename;
            FileOutputStream out = new FileOutputStream(filename);
        
            DatagramSocket socket = new DatagramSocket();
            socket.setSoTimeout (2 * 1000);
            

            
            DatagramPacket sendPacket = new DatagramPacket(message.getBytes(),message.length(), addr, SERVICE_PORT);
            System.out.println ("Sending packet to " + hostname);
            socket.send (sendPacket);
            System.out.print ("receiving file.... \n");
            System.out.println(socket.getReceiveBufferSize());
            
            // CREATE A SMALL PACKET FOR RECEIVING UDP PACKETS
            

            DatagramPacket receivePacket;
            
            do
            {
                
                byte[] recbuf = new byte[BUFSIZE];
                receivePacket=new DatagramPacket(recbuf,BUFSIZE);
                
                boolean timeout = false;
                
                try {
                    socket.receive (receivePacket);
                }catch (InterruptedIOException e){
                    timeout = true;
                }

                if (!timeout)
                {  
                    if(receivePacket.getPort() == SERVICE_PORT && receivePacket.getAddress().equals(hostname))  
                    {                 
                        out.write(receivePacket.getData(),0,receivePacket.getLength());
                        System.out.println ("packet received!" + receivePacket.getAddress() + "size: " + receivePacket.getLength());
                    }

                }else{ // TIMEOUT HAS OCCURED
                    System.out.println ("packet lost!");
                }
                
                
            }while(receivePacket.getLength() > 0);
           
            System.out.println("File received!");
            
        }catch (IOException e){
            System.err.println ("Socket error " + e);
        }
    }
}
