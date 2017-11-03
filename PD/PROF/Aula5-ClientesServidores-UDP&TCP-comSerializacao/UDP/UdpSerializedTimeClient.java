import java.net.*;
import java.io.*;
import java.util.*;

public class UdpSerializedTimeClient {

    public static final int MAX_SIZE = 10000;
    public static final String TIME_REQUEST = "TIME";
    public static final int TIMEOUT = 10; //segundos

    public static void main(String[] args) 
    {
        
        InetAddress serverAddr = null;
        int serverPort = -1;
        DatagramSocket socket = null;
        DatagramPacket packet = null;
        Calendar time = null;
        
        ByteArrayOutputStream bOut = null;
        ObjectOutputStream out = null;
        ObjectInputStream in;
        
        if(args.length != 2){
            System.out.println("Sintaxe: java UdpTimeClient serverAddress serverUdpPort");
            return;
        }

        try{

            serverAddr = InetAddress.getByName(args[0]);
            serverPort = Integer.parseInt(args[1]);   
            socket = new DatagramSocket();
            socket.setSoTimeout(TIMEOUT*1000);
            
            
            bOut = new ByteArrayOutputStream();            
            out = new ObjectOutputStream(bOut);
            
            out.writeObject(TIME_REQUEST);
            out.flush();
            
            packet = new DatagramPacket(bOut.toByteArray(), bOut.size(), 
                    serverAddr, serverPort);
            socket.send(packet);
            
            packet = new DatagramPacket(new byte[MAX_SIZE], MAX_SIZE);
            socket.receive(packet);
            
            in = new ObjectInputStream(new ByteArrayInputStream(packet.getData(), 0, packet.getLength()));                
            time = (Calendar)in.readObject();
           
            System.out.println("Horas: " + time.get(GregorianCalendar.HOUR_OF_DAY) + 
                    " ; Minutos: " + time.get(GregorianCalendar.MINUTE) +
                    " ; Segundos: " + time.get(GregorianCalendar.SECOND));
            
        }catch(UnknownHostException e){
             System.out.println("Destino desconhecido:\n\t"+e);
        }catch(NumberFormatException e){
            System.out.println("O porto do servidor deve ser um inteiro positivo.");
        }catch(SocketTimeoutException e){
            System.out.println("Não foi recebida qualquer resposta:\n\t"+e);
        }catch(SocketException e){
            System.out.println("Ocorreu um erro ao nível do socket UDP:\n\t"+e);
        }catch(IOException e){
            System.out.println("Ocorreu um erro no acesso ao socket:\n\t"+e);
        }catch(ClassNotFoundException e){
             System.out.println("O objecto recebido não é do tipo esperado:\n\t"+e);
        }finally{
            if(socket != null){
                socket.close();
            }
        }
   }
  
}

