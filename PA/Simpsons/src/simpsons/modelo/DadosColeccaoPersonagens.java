package simpsons.modelo;

import java.util.ArrayList;
import java.util.List;

public class DadosColeccaoPersonagens {

    private List<Personagem> personagens = null;
    private int indicePersonagemDestacado = -1;
    private boolean andar = false;

    public DadosColeccaoPersonagens() {
        iniciar();
    }

    public void iniciar() {
        personagens = new ArrayList<>();
        indicePersonagemDestacado = 0;

        personagens.add(new Personagem("Homer"));
        personagens.add(new Personagem("Marge"));
        personagens.add(new Personagem("Bart"));
        personagens.add(new Personagem("Lisa"));
        personagens.add(new Personagem("Maggie"));
    }

    public List<Personagem> getPersonagens() {
        return personagens;
    }

    public void setPersonagens(List<Personagem> personagens) {
        this.personagens = personagens;
    }

    public int getIndicePersonagemDestacado() {
        return indicePersonagemDestacado;
    }

    public Personagem getPersonagemDestacado() {
        if (personagens != null && indicePersonagemDestacado >= 0 && indicePersonagemDestacado < personagens.size()) {
            return personagens.get(indicePersonagemDestacado);
        }

        return null;
    }

    public void setIndicePersonagemDestacado(int indicePersonagemDestacado) {
        if (indicePersonagemDestacado >= 0 && indicePersonagemDestacado < personagens.size()) {
            this.indicePersonagemDestacado = indicePersonagemDestacado;
        }
    }

    public void incIndicePersonagemDestacado() {
        if (personagens != null && personagens.size() > 0) {
            indicePersonagemDestacado = (indicePersonagemDestacado + 1) % personagens.size();
        } else {
            indicePersonagemDestacado = -1;
        }
    }

    public boolean isAndar() {
        return andar;
    }

    public void setAndarOuParar() {
        andar = !andar;
    }

}
