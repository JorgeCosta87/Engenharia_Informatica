
public class args {

    public static void main(String[] args){
        System.out.println("Begin!\n");

        if(args.length > 0){
            System.out.println("Args: \n");
            for(int i = 0 ; i < args.length ; i++){
                System.out.println("\t"+args[i]);
            }
        }
    }
}