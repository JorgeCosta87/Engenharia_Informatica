package aula_3_udp_file;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.InterruptedIOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Aula_3_udp_file {

    // UDP PORT TO WHICH SERVICE IS BOUND
    public static final int SERVICE_PORT = 5001;
    // MAX SIZE OF PACKET
    public static final int BUFSIZE = 4000;
    
    public static String filename = "Foto4.jpg";
    
    
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
            char[] cArray = message.toCharArray();
            byte[] sendbuf = new byte[cArray.length];

            for (int offset = 0; offset < cArray.length ; offset++) {
                sendbuf[offset] = (byte) cArray[offset];
            }
            
            
            DatagramPacket sendPacket = new DatagramPacket(message.getBytes(),
            message.length(), addr, SERVICE_PORT);
            System.out.println ("Sending packet to " + hostname);
            // SEND THE PACKET
            socket.send (sendPacket);
            System.out.print ("receiving file.... ");
            
            // CREATE A SMALL PACKET FOR RECEIVING UDP PACKETS
            
            for(;;)
            {
                byte[] recbuf = new byte[BUFSIZE];
                DatagramPacket receivePacket=new DatagramPacket(recbuf,BUFSIZE);
                // DECLARE A TIMEOUT FLAG
                boolean timeout = false;

            // CATCH ANY INTERRUPTEDIOEXCEPTION THAT IS THROWN WHILE WAITING A UDP PKT
            
                try {
                    socket.receive (receivePacket);
                }catch (InterruptedIOException e){
                    timeout = true;
                }
                
                FileOutputStream out = new FileOutputStream(filename);
                out.write(receivePacket.getData());

                if (!timeout)
                {
                    System.out.println ("packet received!");
                    System.out.println ("Details : "+receivePacket.getAddress());
                    // OBTAIN A BYTE INPUT STREAM TO READ THE UDP PACKET
                    ByteArrayInputStream bin = new ByteArrayInputStream (
                    receivePacket.getData(), 0, receivePacket.getLength() );
                    
                    

                }else{ // TIMEOUT HAS OCCURED
                    System.out.println ("packet lost!");
                }
                
            }
        }catch (IOException e){
            System.err.println ("Socket error " + e);
        }
    }
}
