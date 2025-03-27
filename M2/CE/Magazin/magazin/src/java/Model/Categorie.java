/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Ovidiu
 */
public class Categorie {

    String denumire;
    String id;
    String nrProduse;

    public Categorie(String denumire, String id, String nrProduse) {
        this.denumire = denumire;
        this.id = id;
        this.nrProduse = nrProduse;

    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        //<li><a href="Categorii.jsp">Vezi categorii</a></li>
        sb.append("<li>");
        sb.append("<a href=\"http://localhost:8080/Magazin/produseCategorie.jsp?id=" + id + "\">");
        sb.append(denumire + " (" + String.valueOf(nrProduse) + " produse )");
        sb.append("</a>");
        sb.append("</li>");
        return sb.toString();
    }
}
