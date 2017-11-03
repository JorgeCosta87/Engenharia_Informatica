import java.net.*;
import java.io.*;
import java.util.*;

public class UdpTimeServer {
    public static final int MAX_SIZE = 256;
    public static final String TIME_REQUEST = "TIME";
    
    private DatagramSocket socket;
    private DatagramPacket packet; //para receber os pedidos e enviar as respostas
    private boolean debug;

    public UdpTimeServer(int listeningPort, boolean debug) throws SocketException 
    {
        socket = null;
        packet = null;
        socket = new DatagramSocket(listeningPort);
        this.debug = debug;
    }
    
    public String waitDatagram() throws IOException
    {
        String request;
        
        if(socket == null){
            return null;
        }
        
        packet = new DatagramPacket(new byte[MAX_SIZE], MAX_SIZE);
        socket.receive(packet);
        request = new String(packet.getData(), 0, packet.getLength());
        
        if(debug){
            System.out.println("Recebido \"" + request + "\" de " + 
                    packet.getAddress().getHostAddress() + ":" + packet.getPort());
        }
        
        return request;
    
    }
    
    public void processRequests() throws IOException
    {
        String receivedMsg, timeMsg;
        Calendar calendar;        
        
        if(socket == null){
            return;
        }
        
        if(debug){
            System.out.println("UDP Time Server iniciado...");
        }
        
        while(true){
            
            receivedMsg = waitDatagram();
            
            if(receivedMsg == null){
                continue;
            }
            
            if(!receivedMsg.equalsIgnoreCase(TIME_REQUEST)){
                continue;
            }
            
            calendar = GregorianCalendar.getInstance();
            timeMsg = calendar.get(GregorianCalendar.HOUR_OF_DAY)+":"+ 
                    calendar.get(GregorianCalendar.MINUTE)+":"+calendar.get(GregorianCalendar.SECOND);
            
            packet.setData(timeMsg.getBytes());
            packet.setLength(timeMsg.length());
            
            //O ip e porto de destino ja' se encontram definidos em packet
            socket.send(packet);
            
        }
    }
    
    public void closeSocket()
    {
        if(socket != null){
            socket.close();
        }
    }
    
    public static void main(String[] args) {
        
        int listeningPort;
        UdpTimeServer timeServer = null;
        
        if(args.length != 1){
            System.out.println("Sintaxe: java UdpTimeServer listeningPort");
            return;
        }
        
        try{
            
            listeningPort = Integer.parseInt(args[0]);
            timeServer = new UdpTimeServer(listeningPort, true);         
            timeServer.processRequests();
            
        }catch(NumberFormatException e){
            System.out.println("O porto de escuta deve ser um inteiro positivo.");
        }catch(SocketException e){
            System.out.println("Ocorreu um erro ao nível do socket UDP:\n\t"+e);
        }catch(IOException e){
            System.out.println("Ocorreu um erro no acesso ao socket:\n\t"+e);
        }finally{
            if(timeServer != null){
                timeServer.closeSocket();
            }
        }
    }
}
