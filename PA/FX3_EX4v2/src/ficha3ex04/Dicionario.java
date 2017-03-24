package ficha3ex04;

import java.util.HashMap;

public class Dicionario {

    private HashMap<String, DicionarioDeUmaLingua> dicionarios =
            new HashMap<String, DicionarioDeUmaLingua>();
    private String linguaCorrente = null;

    public void add(String lingua, String origem, String destino) {
        DicionarioDeUmaLingua dicLingua = dicionarios.get(lingua);
        if (dicLingua == null) {
            dicLingua = new DicionarioDeUmaLingua(lingua);
            dicionarios.put(lingua.toLowerCase(), dicLingua);
        }
        dicLingua.add(origem, destino);
    }

    public void defineLingua(String lingua) {
        lingua = lingua.toLowerCase();
        if (dicionarios.get(lingua) != null) {
            linguaCorrente = lingua;
        }
    }

    public String get(String origem) {
        if (linguaCorrente == null) {
            return " lingua nao definida";
        }
        DicionarioDeUmaLingua dic = dicionarios.get(linguaCorrente);
        return dic.getTraducao(origem);
    }

    public String getLinguaCorrente() {
        return linguaCorrente;
    }
    
}
