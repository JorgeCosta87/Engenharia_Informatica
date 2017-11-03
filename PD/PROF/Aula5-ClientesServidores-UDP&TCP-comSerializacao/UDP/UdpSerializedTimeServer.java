import java.net.*;
import java.io.*;
import java.util.*;

public class UdpSerializedTimeServer {
    
    public static final int MAX_SIZE = 10000;
    public static final String TIME_REQUEST = "TIME";
    
    private DatagramSocket socket;
    private DatagramPacket packet; //para receber os pedidos e enviar as respostas
    private boolean debug;

    public UdpSerializedTimeServer(int listeningPort, boolean debug) throws SocketException 
    {
        socket = null;
        packet = new DatagramPacket(new byte[MAX_SIZE], MAX_SIZE);        
        socket = new DatagramSocket(listeningPort);
        this.debug = debug;
    }
    
    public String waitDatagram() throws IOException
    {
        String request;
        ObjectInputStream in;
        
        if(socket == null){
            return null;
        }
        
        socket.receive(packet);
        in = new ObjectInputStream(new ByteArrayInputStream(packet.getData()));

        try{
            request = (String)(in.readObject());
        }catch(ClassCastException | ClassNotFoundException e){
             System.out.println("Recebido objecto diferente de String " + 
                    packet.getAddress().getHostAddress() + ":" + packet.getPort());
            return null;
        }

        if(debug){
            System.out.println("Recebido \"" + request + "\" de " + 
                    packet.getAddress().getHostAddress() + ":" + packet.getPort());
        }
        
        return request;
    
    }
    
    public void processRequests() 
    {
        String receivedMsg;
        Calendar calendar;
        ByteArrayOutputStream bOut;
        ObjectOutputStream out;
         
        if(socket == null){
            return;
        }
        
        if(debug){
            System.out.println("UDP Serialized Time Server iniciado...");
        }
                                   
        while(true){
                
            try{                    

                receivedMsg = waitDatagram();

                if(receivedMsg == null){
                    continue;
                }

                if(!receivedMsg.equalsIgnoreCase(TIME_REQUEST)){
                    continue;
                }

                calendar = GregorianCalendar.getInstance();

                bOut = new ByteArrayOutputStream(MAX_SIZE);            
                out = new ObjectOutputStream(bOut);

                out.writeObject(calendar);
                packet.setData(bOut.toByteArray());
                packet.setLength(bOut.size());

                System.out.println("Tamanho da resposta serializada: "+bOut.size());
                //O ip e porto de destino já se encontram definidos em packet
                socket.send(packet);
                
            }catch(IOException e){
                System.out.println(e);
            }

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
        UdpSerializedTimeServer timeServer = null;
        
        if(args.length != 1){
            System.out.println("Sintaxe: java UdpTimeServer listeningPort");
            return;
        }
        
        try{
            
            listeningPort = Integer.parseInt(args[0]);
            timeServer = new UdpSerializedTimeServer(listeningPort, true);
            timeServer.processRequests();
            
        }catch(NumberFormatException e){
            System.out.println("O porto de escuta deve ser um inteiro positivo.");
        }catch(SocketException e){
            System.out.println("Ocorreu um erro ao nível do socket UDP:\n\t"+e);
        }finally{
            if(timeServer != null){
                timeServer.closeSocket();
            }
        }
    }
}
