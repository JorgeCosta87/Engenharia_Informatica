import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

/**
 *
 * @author Jose' Marinho
 */
public class GetFileUdpServer {

    public static final int MAX_SIZE = 4000;
    
    protected DatagramSocket socket;
    protected File localDirectory;

    public GetFileUdpServer(int listeningPort, File localDirectory) throws SocketException 
    {
        socket = null;
        socket = new DatagramSocket(listeningPort);
        this.localDirectory = localDirectory;
    }
    
    public void processRequests()
    {        
        DatagramPacket packet;
        byte []fileChunck = new byte[MAX_SIZE];
        int nbytes;
        String requestedFileName, requestedCanonicalFilePath = null;
        FileInputStream requestedFileInputStream;
        
        if(socket == null){
            return;
        }

        System.out.println("Servidor de carregamento de ficheiros iniciado...");
        
        try{
            
            while(true){
                
                packet = new DatagramPacket(new byte[MAX_SIZE], MAX_SIZE);
                
                try{                       
                    socket.receive(packet);
                }catch(IOException e){
                    System.out.println("Ocorreu uma excepcao no socket enquanto aguardava pela recepcao de um datagrama: \n\t" + e);
                    System.out.println("O servidor vai terminar...");
                    return;
                }
                    
                try{

                    requestedFileName = new String(packet.getData(), 0, packet.getLength()).trim();
                    
                    System.out.println("Recebido pedido para \"" + requestedFileName + "\" de " + packet.getAddress().getHostAddress() + ":" + packet.getPort());

                    requestedCanonicalFilePath = new File(localDirectory+File.separator+requestedFileName).getCanonicalPath();

                    if(!requestedCanonicalFilePath.startsWith(localDirectory.getCanonicalPath()+File.separator)){
                        System.out.println("Nao e' permitido aceder ao ficheiro " + requestedCanonicalFilePath + "!");
                        System.out.println("A directoria de base nao corresponde a " + localDirectory.getCanonicalPath()+"!");
                        continue;
                    }
                    
                    requestedFileInputStream = new FileInputStream(requestedCanonicalFilePath);
                    System.out.println("Ficheiro " + requestedCanonicalFilePath + " aberto para leitura.");
                    
                    do{
                        
                        nbytes = requestedFileInputStream.read(fileChunck);
                        
                        if(nbytes == -1){//EOF
                            nbytes = 0;
                        }
                            
                        packet.setData(fileChunck, 0, nbytes);
                        packet.setLength(nbytes);
                     
                        socket.send(packet);                       
                        /*
                        * Este programa nao considera o facto do protocolo UDP oferecer um servico do tipo "best effort".
                        * Sendo assim, e' possivel que ocorra perda de datagramas/blocos por erro e esgotamento de buffers.
                        *
                        * Por exemplo, ponha a correr o servidor e os clientes na mesma maquina, transfira ficheiros de
                        * grande dimensao (e.g., fotagrafias com elevada resolucao) e verifique o resultado.
                        * Uma solucao seria a propria aplicacao incluir um mecanismo de controlo de erros e de fuxo(e.g.,
                        * do tipo "stop and wait" com mensagens de confirmacao enviadas pelo cliente a cada bloco recebido,
                        * numeracao dos blocos e verificacao da sequencia, timeout do lado servidor e verificacao da origem
                        * das confirmacoes dado que o UDP nao e' orientado a ligacao).
                        *
                        * No entanto, este esforco adicional nao se justifica. Neste caso, e' preferivel optar pelo protocolo
                        * TCP.
                        *
                        * O pedaco de codigo seguinte que se encontra em comentario permite, em parte, lidar com a situacao de
                        * transferencia de ficheiros de grande dimensao acima referida. No entanto, esta abordagem nao
                        * e' uma solcao aceitavel. E' apenas um remendo que da' mais tempo ao cliente para processar um bloco
                        * antes que o proximo seja enviado pelo servidor, diminuindo, deste modo, a possibilidade de esgotamento
                        * de buffers e consequente perda de datagramas.
                        *
                        */

                        /*
                        try {
                        Thread.sleep(1);
                        } catch (InterruptedException ex) {}
                        */
                                                                       
                    }while(nbytes > 0);     
                    
                    System.out.println("Transferencia concluida");
                    
                    requestedFileInputStream.close();

                }catch(FileNotFoundException e){   //Subclasse de IOException                 
                    System.out.println("Ocorreu a excepcao {" + e + "} ao tentar abrir o ficheiro " + requestedCanonicalFilePath + "!");              
                }catch(IOException e){
                    System.out.println("Ocorreu a excepcao de E/S: \n\t" + e);
                }
             } //while(true)
           
        }finally{
            socket.close();
        }
    }
    
    public static void main(String[] args){
        
        int listeningPort;
        File localDirectory;
        
        if(args.length != 2){
            System.out.println("Sintaxe: java GetFileUdpServer listeningPort localRootDirectory");
            return;
        }        
        
        localDirectory = new File(args[1].trim());

        if(!localDirectory.exists()){
           System.out.println("A directoria " + localDirectory + " nao existe!");
           return;
       }

       if(!localDirectory.isDirectory()){
           System.out.println("O caminho " + localDirectory + " nao se refere a uma directoria!");
           return;
       }

       if(!localDirectory.canRead()){
           System.out.println("Sem permissoes de leitura na directoria " + localDirectory + "!");
           return;
       }
        
       try {
           
            listeningPort = Integer.parseInt(args[0]);
            if(listeningPort <= 0) throw new NumberFormatException("Porto UDP de escuta indicado <= 0 (" + listeningPort + ")");
                        
            new GetFileUdpServer(listeningPort, localDirectory).processRequests();            
        
        }catch(NumberFormatException e){
            System.out.println("O porto de escuta deve ser um inteiro positivo:\n\t"+e);
        }catch(SocketException e){
            System.out.println("Ocorreu uma excepcao ao nivel do socket UDP:\n\t"+e);
        }
       
    }
    
}
