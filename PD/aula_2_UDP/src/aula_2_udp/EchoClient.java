package aula_2_udp;

import java.net.*;
import java.io.*;



public class EchoClient
{
// UDP PORT TO WHICH SERVICE IS BOUND
public static final int SERVICE_PORT = 6001;
// MAX SIZE OF PACKET
public static final int BUFSIZE = 256;

   
public static void main(String args[])
{
    //if (args.length != 1){
    //System.err.println ("Syntax - java EchoClient hostname");
    //return;
    //}
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
        for (int i = 1 ; i <= 10; i++){
    // COPY SOME DATA TO OUR PACKET
        String message = "TIME";
        char[] cArray = message.toCharArray();
        byte[] sendbuf = new byte[cArray.length];
        for (int offset = 0; offset < cArray.length ; offset++) {
        sendbuf[offset] = (byte) cArray[offset];
}

    // CREATE A PACKET TO SEND TO THE UDP SERVER
    DatagramPacket sendPacket = new DatagramPacket(sendbuf,
    sendbuf.length, addr, SERVICE_PORT);
    System.out.println ("Sending packet to " + hostname);
    // SEND THE PACKET
    socket.send (sendPacket);
    System.out.print ("Waiting for packet.... ");
    // CREATE A SMALL PACKET FOR RECEIVING UDP PACKETS
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
    
    if (!timeout){
        System.out.println ("packet received!");
        System.out.println ("Details : "+receivePacket.getAddress());
        // OBTAIN A BYTE INPUT STREAM TO READ THE UDP PACKET
        ByteArrayInputStream bin = new ByteArrayInputStream (
        receivePacket.getData(), 0, receivePacket.getLength() );
        // CONNECT A READER FOR EASIER ACCESS
        BufferedReader reader = new BufferedReader (
        new InputStreamReader ( bin ) );


    // LOOP INDEFINITELY UNITL EVERY LINE OF TEXT WAS DISPLAYED
    for (;;)
    {
    String line = reader.readLine();
    // CHECK FOR END OF DATA
    if (line == null)
    break;
    else
    System.out.println (line);
    }
    }else{ // TIMEOUT HAS OCCURED
    System.out.println ("packet lost!");
    }
// SLEEP FOR A SECOND, TO ALLOW USER TO SEE PACKET
try {
Thread.sleep(1000);
}catch (InterruptedException e) {}
} // for (int i = 1 ; i <= 10; i++)
}catch (IOException e){
System.err.println ("Socket error " + e);
}
} // main(String args[])
}