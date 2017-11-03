package aula_udd_srv_echo;

import java.net.*;
import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;


public class EchoServer {

    // UDP PORT TO WHICH SERVICE IS BOUND
    public static final int SERVICE_PORT = 7000;
    // MAX SIZE OF PACKET, LARGE ENOUGH FOR ALMOST ANY CLIENT
    public static final int BUFSIZE = 4096;
    // SOCKET USED FOR READING AND WRITING UDP PACKETS
    private DatagramSocket socket;

    public EchoServer() //constructor
    {
    try
    {
        socket = null;
        // BIND TO THE SPECIFIED UDP PORT
        socket = new DatagramSocket( SERVICE_PORT );
        System.out.println("Server active on port "+socket.getLocalPort());
    }catch (Exception e){
        System.err.println ("Unable to bind port");
        }
    }
    public void serviceClients()
    {
        if(socket == null) return;
            // CREATE A BUFFER LARGE ENOUGH FOR INCOMING PACKETS
        byte[] buffer = new byte[BUFSIZE];
        
        for (;;){ //while(true)
            try {
                // CREATE A DATAGRAMPACKET FOR READING UDP PACKETS
                DatagramPacket packet = new DatagramPacket ( buffer, BUFSIZE );
                // RECEIVE INCOMING PACKETS
                socket.receive(packet);
                System.out.println("Packet received from " + packet.getAddress()
                + ":" + packet.getPort() + " of length " + packet.getLength());
            // ECHO THE PACKET BACK - ADDRESS AND PORT ARE ALREADY SET!
            
            Calendar calendar = GregorianCalendar.getInstance();
            String timeMsg = calendar.get(GregorianCalendar.HOUR_OF_DAY) + ":" + 
                        calendar.get(GregorianCalendar.MINUTE) + ":"
                        +calendar.get(GregorianCalendar.SECOND);
            
             packet.setData(timeMsg.getBytes());//, BUFSIZE, timeMsg.length());
                
                socket.send(packet);
                
            }catch (IOException e){
                System.err.println ("Error : " + e);
            }
        } // for(;;)
} // serviceClientes() method
public static void main(String args[])
{
    EchoServer server = new EchoServer();
    server.serviceClients();
}
}
