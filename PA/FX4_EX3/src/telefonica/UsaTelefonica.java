/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telefonica;

import ficheiros.Ficheiros;
import java.io.BufferedReader;
import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author Administrator
 */
public class UsaTelefonica {

    private static String[] menu = {
        "Acrescentar cartoes lidos de ficheiro de texto", // 1
        "Carregamento",
        "Chamada",
        "Ver saldo",
        "Imprimir factura detalhada para ficheiro de texto", // 5
        "Listar cartoes por ordem natural",
        "Listar cartoes por ordem de numeros",
        "Listar cartoes por ordem de saldos",
        "Gravar para ficheiro de objectos",
        "Ler de ficheiro de objectos",
        "Ver tipos",
        "Acrescenta tipo",
        "Sair"
    };
    private static String[] menuFicheiro = {"Substituir", "Acrescentar"};
    private Telefonica modelo;

    public UsaTelefonica(Telefonica m) {
        modelo = m;
    }

    public void corre() {

        int opcao;
        boolean continua = true;
        Scanner sc = new Scanner(System.in);

        while (continua) {
            System.out.println(dataDeHoje());
            opcao = Ficheiros.lerOpcaoInt(menu, sc);
            switch (opcao) {
                case 1: // Acrescentar cartoes lidos de ficheiro de texto
                     {
                        System.out.println("Nome do ficheiro de texto a ler  ");
                        String nome = sc.next();
                        sc.skip("\n");
                        System.out.println("Foram acrescentados " + modelo.acrescentaCartoes(lerFTexto(nome)) + " cartoes ");
                    }
                    break;
                case 2: // Carregamento
                     {
                        System.out.println("Numero de telemovel: ");
                        int numero = sc.nextInt();
                        System.out.println("Valor do carregamento: ");
                        double valor = sc.nextDouble();
                        sc.skip("\n");
                        if (modelo.fazCarregamento(numero, valor)) {
                            System.out.println("Carregamento realizado");
                        } else {
                            System.out.println("Carregamento nao realizado");
                        }
                    }
                    break;
                case 3: // Chamada
                     {
                        System.out.println("Numero de telemovel origem: ");
                        int origem = sc.nextInt();
                        System.out.println("Numero de telemovel destino: ");
                        int destino = sc.nextInt();
                        System.out.println("Quantos segundos durou a chamada? ");
                        int segundos = sc.nextInt();
                        sc.skip("\n");
                        if (modelo.fazChamada(origem, destino, segundos)) {
                            System.out.println("Chamada realizada");
                        } else {
                            System.out.println("Chamada nao realizada");
                        }
                        ;
                    }
                    break;
                case 4: // Ver saldo
                     {
                        System.out.println("Numero de telemovel: ");
                        int numero = sc.nextInt();
                        sc.skip("\n");
                        System.out.println("Saldo deste cartao: " + modelo.getSaldo(numero));
                    }
                    break;
                case 5: // Imprimir factura detalhada para ficheiro de texto
                     {
                        System.out.println("Numero de telemovel: ");
                        int numero = sc.nextInt();
                        sc.skip("\n");
                        String factura = modelo.facturaDetalhada(numero);
                        System.out.println("Factura detalhada: " + factura);

                        System.out.println("Nome do ficheiro de texto a gravar  ");
                        String nome = sc.next();
                        sc.skip("\n");

                        if (!gravarFTexto(nome, true, false, factura)) {

                            System.out.println("Existe um ficheiro com este nome ou erro ao gravar");
                            int opcao2 = Ficheiros.lerOpcaoInt(menuFicheiro, sc);
                            switch (opcao2) {
                                case 1:
                                    if (!gravarFTexto(nome, false, false, factura)) {
                                        System.out.println("Problemas a gravar o ficheiro de texto");
                                    }
                                    break;
                                case 2:
                                    if (!gravarFTexto(nome, false, true, factura)) {
                                        System.out.println("Problemas a gravar o ficheiro de texto");
                                    }
                                    break;
                            }
                        } else {
                            System.out.println("Factura gravada no ficheiro de texto " + nome);
                        }
                    }
                    break;
                case 6: // Listar cartoes por ordem natural                       
                    System.out.println("Listagem de cartoes:\n " + modelo);
                    break;
                case 7: // Listar cartoes por ordem de numeros                     
                    System.out.println("Listagem de cartoes:\n " + modelo.toStringPorNumero());
                    break;
                case 8: // Listar cartoes por ordem de saldos                       
                    System.out.println("Listagem de cartoes:\n " + modelo.toStringPorSaldo());
                    break;
                case 9: // Gravar
                    try{
                        ObjectOutputStream out = Ficheiros.abreFObjectosEscrita("telefonica", false, false);
                        out.writeObject(modelo);
                        out.close();
                    }catch(IOException e){
                        System.out.println(" Erro ao gravar o ficheiro");
                    }
                    break;
                case 10: // Ler
                    try{
                        ObjectInputStream in = Ficheiros.abreFObjectosLeitura("telefonica");
                        Telefonica m = (Telefonica)in.readObject();
                        if(m != null){
                            modelo = m;
                        }
                        in.close();
                    }catch(EOFException e){
                        System.out.println(" Fim de ficheiro");
                    }
                    catch(Exception e){
                        System.out.println(" Erro ao ler o ficheiro");
                    }
                    break;
                case 11: // ver tipos
                    System.out.println(" Tipos: " + Cartao.getTipos());
                    break;
                case 12: //  + tipo
                    String tipo = "";
                    System.out.println("Digite um novo tipo");
                    tipo = sc.next();
                    Cartao.addTipo(tipo);
                    break;
                case 13: // Sair
                    continua = false;
                    break;
            }

        }
    }


    // ler os dados de um conjunto de cartoes, um por linha
    // cada linha tem o tipo do cartao, o numero e o saldo, exemplo:
    //Tagarela 111111111 25
    //PoucoTempo 222222222 25
    // retorna um arraylist com objectos Cartao correspondentes aos cartoes lidos
    // ou null em caso de insucesso
    public List<Cartao> lerFTexto(String nome) {

        BufferedReader in = null;
        List<Cartao> cartoes = new ArrayList<Cartao>();
        try {
            in = Ficheiros.abreFTextoLeitura(nome);
            String linha = null;
            while ((linha = in.readLine()) != null) {
                Scanner scLinha = new Scanner(linha);
                if (!scLinha.hasNext()) {
                    continue;
                }
                String tipo = scLinha.next();
                if (!scLinha.hasNextInt()) {
                    continue;
                }
                int numero = scLinha.nextInt();
                if (!scLinha.hasNextDouble()) {
                    continue;
                }
                double saldo = scLinha.nextDouble();
                if (tipo.equalsIgnoreCase("Tagarela")) {
                    cartoes.add(new Tagarela(numero, saldo));
                } else if (tipo.equalsIgnoreCase("PoucoTempo")) {
                    cartoes.add(new PoucoTempo(numero, saldo));
                }
            }
            in.close();

        } catch (IOException e) {
            return null;
        }
        return cartoes;
    }

    // grava a factura detalhada dum cartao num ficheiro de texto
    // nome - nome do ficheiro
    // novo - true se for exigido um novo ficheiro para escrita
    // ap   - true se no caso de existir o ficheiro escrever no fim (append)
    // retorna true se a operação tiver sucesso
    public boolean gravarFTexto(String nome, boolean novo, boolean ap, String factura) {
        PrintWriter out = null;
        try {
            out = Ficheiros.abreFTextoEscrita(nome, novo, ap);
            out.println(factura);
            out.close();
        } catch (IOException e) {
            return false;
        }
        return true;
    }

    public String dataDeHoje() {
        String mes[] = {"Janeiro", "Fevereiro", "Março", "Abril",
            "Maio", "Junho", "Julho", "Agosto",
            "Setembro", "Outubro", "Novembro",
            "Dezembro"
        };
        String diaSem[] = {"", "Domingo", "Segunda",
            "Terça", "Quarta", "Quinta",
            "Sexta", "Sábado"
        };
        Calendar agora = new GregorianCalendar();

        
        String hoje = diaSem[agora.get(Calendar.DAY_OF_WEEK)] + ", " + agora.get(Calendar.DAY_OF_MONTH) 
                      + " de " + mes[agora.get(Calendar.MONTH)] + " de " + agora.get(Calendar.YEAR) 
                      + " " + agora.get(Calendar.HOUR_OF_DAY) + ":" + agora.get(Calendar.MINUTE) 
                      + ":" + agora.get(Calendar.SECOND);
        
                
        return hoje;

    }
}
