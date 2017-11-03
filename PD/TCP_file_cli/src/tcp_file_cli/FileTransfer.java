package tcp_file_cli;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;




public class FileTransfer {


public static final int MAX_SIZE = 4000;
public static final int TIMEOUT = 5; //segundos
public static final int SERVICE_PORT = 6001;
    
    public static void main(String[] args) {
       
//        if (args.length != 1){
//            System.out.println ("Syntax – java DaytimeClient host");
//        return;
        

        String hostname = "10.65.132.252";
        
        File localDirectory = new File("C:\\Users\\Costa\\Documents\\Repos\\Engenharia_Informatica\\PD\\TCP_file_cli");
        String localFilePath = null;
                
        PrintWriter pout;
        InputStream in;
        
        byte [] buffer = new byte[4096];
        
        String fileName = "Foto.3.jpg";
        
        FileOutputStream localFileOutputStream;
                
        try{

            localFilePath = localDirectory.getCanonicalPath()+File.separator+fileName;
            localFileOutputStream = new FileOutputStream(localFilePath);
            System.out.println("Ficheiro " + localFilePath + " criado.");

        }catch(IOException e){

            if(localFilePath == null){
                System.out.println("Ocorreu a excepcao {" + e +"} ao obter o caminho canonico para o ficheiro local!");   
            }else{
                System.out.println("Ocorreu a excepcao {" + e +"} ao tentar criar o ficheiro " + localFilePath + "!");
            }

            return;
        }
        
        
        try {
        
        Socket socket = new Socket (hostname, SERVICE_PORT);
        System.out.println ("Connection established");
        socket.setSoTimeout( 4000 ); //ms
        
       pout = new PrintWriter(socket.getOutputStream(), true);
       pout.println(fileName);
        
       in = socket.getInputStream();
       
       int size = 0;
       
       while((size = in.read(buffer)) > 0)
       {
           localFileOutputStream.write(buffer, 0, buffer.length);
       }
        
        }
            catch (IOException e)
        { //catches also InterruptedIOException
            System.err.println ("Error " + e);
        }
    }
    
}
