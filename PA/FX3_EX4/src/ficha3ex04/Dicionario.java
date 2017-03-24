package ficha3ex04;

import java.util.HashMap;

public class Dicionario {

    private HashMap<String, HashMap<String, String>> dicionarios =
            new HashMap<String, HashMap<String, String>>();
    private String linguaCorrente = null;

    public void add(String lingua, String origem, String destino) {
        HashMap<String, String> dicLingua = dicionarios.get(lingua);
        if (dicLingua == null) {
            dicLingua = new HashMap<String, String>();
            dicionarios.put(lingua.toLowerCase(), dicLingua);
        }
        dicLingua.put(origem.toUpperCase(), destino.toLowerCase());
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
        HashMap<String, String> dic = dicionarios.get(linguaCorrente);
        return dic.get(origem.toUpperCase());
    }

    public String getLinguaCorrente() {
        return linguaCorrente;
    }
    
}
