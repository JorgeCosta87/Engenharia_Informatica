/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fx1_ex8;

/**
 *
 * @author Admin2
 */
public class TriangPascal {
    private int[][] tri;

    public TriangPascal(int prof) {
        criaTriang(prof);
    }

    /**
     *
     * @param prof
     */
    public final void criaTriang(int prof) {
        if (prof < 1) {
            return;
        }
        tri = new int[prof][];
        for (int i = 0; i < prof; i++) {
            tri[i] = new int[i + 1];
            tri[i][0] = tri[i][i] = 1;
            for (int j = 1; j < i; j++) {
                tri[i][j] = tri[i - 1][j - 1] + tri[i - 1][j];
            }
        }
    }

    @Override
    public String toString() {
        String s = new String();
        if (tri == null) {
            return s;
        }
        for (int i = 0; i < tri.length; i++) {

            for (int j = 0; j < tri.length - tri[i].length; j++) {
                s += ("  ");
            }
            for (int j = 0; j < tri[i].length; j++) {
                s += String.format("%4d", tri[i][j]);
//                s += (tri[i][j] + " ");
            }
            s += "\n";
        }
        return s;
    }
}
