package ficheiros;

import java.io.*;
import java.util.Scanner;

public class Ficheiros {

    //**************Ler opcao do teclado*****************
    public static int lerOpcaoInt(String[] menu, Scanner s) {

        if (menu == null) {
            return -1;
        }
        System.out.println("Escolha uma opção" + "");
        for (int i = 0; i < menu.length; i++) {
            System.out.println("" + (i + 1) + " - " + menu[i]);
        }

        while (true) {
            System.out.println("opcao > ");
            int op = s.nextInt();
            s.skip("\n");
            if ((op > 0) && (op <= menu.length)) {
                return op;
            } else {
                System.out.println("Opção inválida");
            }
        }
    }

//***************Texto*************************
    public static BufferedReader abreFTextoLeitura(String nome)
            throws FileNotFoundException {
        BufferedReader in = new BufferedReader(new FileReader(nome));// throws FileNotFoundException
        return in;
    }

    public static PrintWriter abreFTextoEscrita(String nome, boolean novo,
            boolean ap) throws IOException {
        File f = new File(nome);
        if (novo && f.isFile()) {
            throw new IOException("Ficheiro existente");
        }
        PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f,
                ap)));
        return out;
    }

//  ***************Objectos**********************
    public static ObjectInputStream abreFObjectosLeitura(String nome) throws IOException {
        File f = new File(nome);

        ObjectInputStream in = new ObjectInputStream(new FileInputStream(f));
        return in;
    }

    public static ObjectOutputStream abreFObjectosEscrita(String nome, boolean novo,
            boolean ap) throws IOException {
        File f = new File(nome);
        if (novo && f.isFile()) {
            throw new IOException("Ficheiro existente");
        }
        ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(f,
                ap));
        return out;
    }
}

