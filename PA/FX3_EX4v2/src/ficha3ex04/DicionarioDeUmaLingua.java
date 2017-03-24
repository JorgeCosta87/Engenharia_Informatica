package ficha3ex04;

import java.util.HashMap;
import java.util.Map;

public class DicionarioDeUmaLingua {
    private Map <String, String> dic = new HashMap< String, String >();
    private String lingua;

    public DicionarioDeUmaLingua(String lingua) {
        this.lingua = lingua;
    }

    public String getLingua() {
        return lingua;
    }

    public void setLingua(String lingua) {
        this.lingua = lingua;
    }
    public void add( String palavra, String traducao){
        dic.put(palavra.toUpperCase(), traducao.toLowerCase());
    }
    String getTraducao( String palavra){
        return dic.get(palavra);
    }
}
