package fx2_ex1;

/**
 *
 * @author Admin2
 */
public class Enfor {
    private static String[] dic = {"AMANHA", "ARQUIMEDES", "LEAO", "TIGRE", "ZEBRA", "PRATO", "CASTANHO", "LARANJA",
        "ERVILHA", "LONTRA", "LASTRO", "ORANGOTANGO", "DISCIPLINA", "PROGRAMACAO", "BATATA", "PALHACO",
        "CEREBRO", "ATUM", "PORTUGAL", "SILVESTRE", "ANIMAL", "IRRACIONAL", "MATEMATICA", "DISCRETO",
        "EFICAZ", "EFICIENTE", "MARAVILHA", "SINOPSE", "DISPOSITIVO", "LINEAR", "LIMAO", "LAMPADA", "ORELHA",
        "BUFALO", "SAPATO", "LAGOSTA", "ARRISCADO", "RISCADO", "CARNAVAL", "ARROJADO", "LIBERTADO", "SIMPLES",
        "COMPLEXO", "AGRAFADOR", "MONITOR", "TECLADO", "CHAVE", "RELOGIO", "LENCO", "JANELA", "CORDA", "VIOLA",
        "GUITARRA", "PONTEIRO", "ARGUENTE", "SAGAZ", "ERRONEO", "INSTITUTO", "SUPERIOR", "ENGENHARIA", "DEPARTAMENTO",
        "INFORMATICA", "SISTEMA", "CONVOCATORIA", "PRESIDENTE", "FEVEREIRO", "AUMENTO", "SALARIO", "DINHEIRO", "IMEDIATO",
        "FLAMINGO", "RINOCERONTE", "HIPOPOTAMO", "BACALHAU", "PARGO", "SARDINHA", "CARACOL", "INSECTO", "VOADOR",
        "LARANJA", "ASPERSAO", "EXTINTO", "EXTERIOR", "AMBIVALENTE"};
    private StringBuffer usadas;  // guarda as letras que já foram tentativas
    private StringBuffer palavra; // guarda o conhecimento que o utilizador
    // tem da palavra escolhida aleat.
    // (letras adivinhadas e * nos lugares desconhecidos)
    private int escolha; // indice correspondente à palavra escolhida aleat.
//    private boolean acertou;
    private int tentativas = 0;
    private int estado;
    private String msg;
    public static final int INICIO = 0, JOGO = 1, FIM = 2;

    public Enfor() {
        iniciar();
    }
    // metodos que consultam

    public int getEstado() {
        return estado;
    }

    public int getTentativas() {
        return tentativas;
    }

    public String getPalavra() {
        return new String(palavra);
    }

    public String getUsadas() {
        return new String(usadas);
    }

    public String getMsg() {
        return msg;
    }

    private String instrucoes() {
        String s = "";
        s += "\n---------- Intrucoes ------------"
                + "\n- Uma letra = uma tentativa     -"
                + "\n- Uma palavra = tentativa final -"
                + "\n---------------------------------\n";
        return s;
    }
    //	 metodos que alteram	

    public void iniciar() {
        usadas = new StringBuffer(26);
        escolha = (int) (Math.random() * dic.length); // a palavra escolhida foi dic[escolha]
        palavra = new StringBuffer(dic[escolha]); // tantas letras quanto a palavra escolhida
        for (int i = 0; i < dic[escolha].length(); i++) // mas inicialmente * em vez das letras
        {
            palavra.setCharAt(i, '*');
        }
//        acertou = false;
        tentativas = 0;
        msg = instrucoes();
        estado = INICIO;
    }

    private void adivPalavra(String aposta) {
        if (aposta.equals(dic[escolha])) {
//            acertou = true;
            msg = "===" + dic[escolha] + "===\nAcertaste em " + tentativas
                    + " Tentativa(s).\n";
        } else {
//            acertou = false;
            msg = "Esta errado" + "\nA palavra era " + dic[escolha]
                    + "\nGastaste " + tentativas + " Tentativa(s)\n";
        }
        estado = FIM;
    }

    private void adivLetra(char letra) {
        if ((letra < 'A') || (letra > 'Z')) {
            msg = "Isso nao é uma letra!\n";
        } else if (usadas.toString().indexOf(letra) != -1) {
            msg = "Ja tinhas usado essa letra!\n";
        } else {
            usadas.append(letra);
            for (int i = 0; i < palavra.length(); i++) {
                if ((palavra.charAt(i) == '*')
                        && (dic[escolha].charAt(i) == letra)) {
                    palavra.setCharAt(i, letra);
                }
            }
            msg = "Nova letra...\n";
            if (palavra.toString().equals(dic[escolha])) {
//                acertou = true;
                msg = "===" + dic[escolha] + "===\nAcertaste em " + tentativas
                        + " Tentativa(s).\n";
                estado = FIM;
            }
        }
    }

    public void adivinhar(String ap) {

        if (estado == FIM) {
            return;
        }
        estado = JOGO;
        String aposta = ap.toUpperCase();
        if (aposta.length() <= 0) {
            return;
        }
        tentativas++;
        if (aposta.length() > 1) {
            adivPalavra(aposta);
        } else {
            char letra = aposta.charAt(0);
            adivLetra(letra);
        }
    }
}