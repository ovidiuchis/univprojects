/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Ovidiu
 */
public class Cos {

    ArrayList<Produs> prod = new ArrayList<Produs>();

    public void Cos() {
    }

    public void adaugaInCos(Produs p) {
        prod.add(p);
    }

    public String afiseazaProduse() {
        StringBuilder sb = new StringBuilder();

        if (prod != null) {
            for (int i = 0; i < prod.size(); i++) {
                sb.append(prod.get(i).toStringCos());
                sb.append("</p></br></br>");
            }

        }
        return sb.toString();
    }

    public float iaTotal() {
        float total = 0;
        for (int i = 0; i < prod.size(); i++) {
            total += prod.get(i).iaPret();
        }

        return total;
    }
}
