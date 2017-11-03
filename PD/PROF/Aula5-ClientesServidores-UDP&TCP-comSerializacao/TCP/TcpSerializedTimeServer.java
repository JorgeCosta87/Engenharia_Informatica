import java.util.*;
import java.net.*;
import java.io.*;

public class TcpSerializedTimeServer {

    public static final int MAX_SIZE = 256;
    public static final String TIME_REQUEST = "TIME";
    
    private ServerSocket socket;
    private boolean debug;

    public TcpSerializedTimeServer(String args[], boolean debug)
    {
        int listeningPort;

        socket = null;
        this.debug = debug;
        
        try{
            
            listeningPort = Integer.parseInt(args[0]);
            socket = new ServerSocket(listeningPort);
            
        }catch(NumberFormatException e){
            System.out.println("O porto de escuta deve ser um inteiro positivo:\n\t"+e);
        }catch(IOException e){
            System.out.println("Ocorreu um erro na criação do socket de escuta:\n\t"+e);
            socket = null;
        }             
    }
    
    public final void processRequests()
    {
        Socket toClientSocket;
        ObjectInputStream in;
        ObjectOutputStream out;
        String request;
        Calendar calendar;    
        
        if(socket == null){
            return;
        }
        
        System.out.println("TCP Serialized Time Server iniciado no porto " + socket.getLocalPort() + " ...");
        
        while(true){     
            
            try{
                toClientSocket = socket.accept();
            }catch(IOException e){
                System.out.println("Erro enquanto aguarda por um pedido de ligação:\n\t"+e);
                return;
            }

            try{
                
                out = new ObjectOutputStream(toClientSocket.getOutputStream());            
                in = new ObjectInputStream(toClientSocket.getInputStream());

                request = (String)(in.readObject());

                if(request == null){ //EOF
                    toClientSocket.close();
                    continue; //to next client request
                }

                if(debug){
                    System.out.println("Recebido \"" + request.trim() + "\" de " + 
                            toClientSocket.getInetAddress().getHostAddress() + ":" + 
                            toClientSocket.getPort());
                }

                if(!request.equalsIgnoreCase(TIME_REQUEST)){
                    toClientSocket.close();
                    continue;
                }

                //Constroi a resposta terminando-a com uma mudanca de lina
                calendar = GregorianCalendar.getInstance();

                //Envia a resposta ao cliente
                out.writeObject(calendar);
                out.flush();

            }catch(IOException e){
                 System.out.println("Erro na comunicação como o cliente " + 
                    toClientSocket.getInetAddress().getHostAddress() + ":" + 
                        toClientSocket.getPort()+"\n\t" + e);
            }catch (ClassNotFoundException e){
                System.out.println("Pedido recebido de tipo inesperado:\n\t"+e);
            }finally{
                try{
                    if(toClientSocket != null){
                        toClientSocket.close();
                    }
                }catch(IOException e){}
            }
        } //while
    }
       
    public static void main(String[] args) 
    {
        
        TcpSerializedTimeServer timeServer;
        
        if(args.length != 1){
            System.out.println("Sintaxe: java TcpTimeServer listeningPort");
            return;
        }
        
        timeServer = new TcpSerializedTimeServer(args, true);
        timeServer.processRequests();
       
    }
}

