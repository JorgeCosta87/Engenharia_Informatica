

import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Calendar;


public class Client {

    
    public static final int MAX_SIZE = 4096;
    public static final int TIMEOUT = 5;
    public static final int PORT = 6001;
    
  
    
    public static void main(String[] args)
    {
        String timeStr = "TIME";

        String hostName = "10.204.128.70";
        
        Socket socket;
        
        ObjectInputStream in;
        ObjectOutputStream out;
        
        try {
            
            socket = new Socket(hostName, PORT);
            
            System.out.println("Connection established");

            in = new ObjectInputStream(socket.getInputStream());
            out = new ObjectOutputStream(socket.getOutputStream());
            
            out.writeObject(timeStr);
            out.flush();

            
            Time time;
            
            time = (Time)in.readObject();

            System.out.println("Time: " + time);

             socket.close();
             
             
        } catch (Exception e) {
            
            System.out.println("Unable to send the obj");
            e.printStackTrace();
        }
       
    }
    
}
