
package ficha4ex02.iu.texto;

import ficha4ex02.logica.LivroAntigo;
import ficha4ex02.logica.LivroActual;
import ficha4ex02.logica.Livro;
import ficha4ex02.logica.GereFicheirosBiblioteca;
import ficha4ex02.logica.Biblioteca;
import java.io.IOException;
import java.util.Scanner;

/**
 *
 * @author Admin2
 */
public class UsaBiblioteca {

    private static String[] menu = {
        "Preenche a biblioteca manualmente",//1
        "Acrescentar livros lidos de ficheiro de texto", // 2
        "Gravar para ficheiro de texto",
        "Ler de ficheiro de objectos",
        "Gravar para ficheiro de objectos",//5
        "Listar livros sem ordenacao",
        "Listar livros por codigo", //7
        "Listar livros por  titulo",
        "Pesquisar livro por codigo",//9
        "Remover livro por codigo",
        "Sair"//11
    };

    private Biblioteca bib;

    public UsaBiblioteca(Biblioteca b) {
        bib = b;
    }

    public void corre() {

        int opcao;
        boolean continua = true;
        Scanner sc = new Scanner(System.in);

        while (continua) {
            opcao = lerOpcaoInt(menu, sc);
            switch (opcao) {
                case 1://Preenche a biblioteca manualmente
                {
                    preencheBibManualmente();
                }
                break;
                case 2: // Acrescentar livros lidos de ficheiro de texto
                {
                    System.out.println("Nome do ficheiro de texto a ler  ");
                    String nome = sc.next();
                    sc.skip("\n");
                    try {
                        GereFicheirosBiblioteca.preencheBibDeFichTexto(bib, nome);
                    } catch (IOException | ClassNotFoundException e) {
                        System.out.println();
                        System.out.println("Ficheiro " + nome + ": " + e);
                        System.out.println();
                    }
                }
                break;
                case 3: // Gravar para ficheiro de texto
                {
                    try {
                        GereFicheirosBiblioteca.escreveBibEmFichTexto(bib, bib.getNome() + ".txt");
                    } catch (IOException | ClassNotFoundException e) {
                        System.out.println();
                        System.out.println("Ficheiro \"" + bib.getNome() + ".txt" + "\": " + e);
                        System.out.println();
                    }
                }
                break;
                case 4://Ler de ficheiro de objectos
                {
                    try {
                        Biblioteca outra = GereFicheirosBiblioteca.carregaBibDeFicheiroBinario("biblioteca.bin");
                        bib = outra;
                    } catch (IOException | ClassNotFoundException e) {

                        System.out.println();
                        System.out.println("Ficheiro biblioteca.bin: " + e);
                        System.out.println();

                    }
                }
                break;
                case 5://Gravar para ficheiro de objectos
                {
                    boolean gravou = false;
                    gravou = GereFicheirosBiblioteca.guardaBibEmFicheiroBinario(bib, "biblioteca.bin");
                    if (gravou) {
                        System.out.println(" Gravou com sucesso em ficheiro de objectos ");
                    } else {
                        System.out.println(" Erro ao gravar em ficheiro de objectos ");
                    }
                }
                break;
                case 6://Listar livros sem ordenacao
                {
                    System.out.println("(Sem ordenacao) " + bib);
                }
                break;
                case 7://Listar livros por codigo
                {
                    System.out.println("(Ordenacao por codigo) " + bib.toStringOrdenacaoCodigo());
                }
                break;
                case 8://Listar livros por titulo
                {
                    System.out.println("(Ordenacao por titulo) " + bib.toStringOrdenacaoTitulo());
                }
                break;
                case 9://Pesquisar livro por codigo
                {
                    System.out.println("Codigo do livro: ");
                    int codigo = sc.nextInt();
                    sc.skip("\n");
                    Livro livro = bib.pesquisaLivro(codigo);
                    if (livro != null) {
                        System.out.println(livro);
                    } else {
                        System.out.println("Nao existe livro com este codigo");
                    }
                }
                break;
                case 10://Remover livro por codigo
                {
                    System.out.println("Codigo do livro: ");
                    int codigo = sc.nextInt();
                    sc.skip("\n");
                    if (bib.eliminaLivro(codigo)) {
                        System.out.println("Livro removido com sucesso");
                    } else {
                        System.out.println("Nao existe livro com este codigo");
                    }
                }
                break;
                case 11://Sair
                {
                    continua = false;
                }
                break;

            }
        }
    }

    //**************Ler opcao do teclado*****************
    public int lerOpcaoInt(String[] menu, Scanner s) {

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

    public void preencheBibManualmente() {
        String[] autores1 = {"Aut1", "Aut2"};
        String[] autores2 = {"Aut3"};
        String[] autores3 = {"Aut4", "Aut5", "Aut6"};

        bib.acrescentaLivro("Tit2", autores1);
        bib.acrescentaLivro("Tit3", autores2);
        bib.acrescentaLivro(new Livro("Tit1", autores3));

        bib.acrescentaLivro(new LivroAntigo("Tit5", autores2, 10));
        bib.acrescentaLivro(new LivroActual("Tit4", autores3, "978-972", 25.56));
    }

}
