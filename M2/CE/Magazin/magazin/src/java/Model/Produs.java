package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Ovidiu
 */
public class Produs {

    private String detalii;
    private String nume;
    private String categoria;
    private String urlPoza;
    private int id;
    private float pret;

    public Produs(int id, String nume, String detalii, String url, String categoria,  float pret) {
        this.detalii = detalii;
        this.id = id;
        this.nume = nume;
        this.categoria = categoria;
        this.urlPoza = url;
        this.pret=pret;
    }
    
    public Float iaPret(){
       return this.pret;
    }
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("<img src=\"http://localhost:8080/Magazin/imag/" + urlPoza + "\" WIDTH=100 HEIGHT=100 align=left alt=poza/>");
        sb.append("</br><b> Produs </b>" + nume);
        sb.append("</br><b> Pret </b>" + String.valueOf(pret));
        sb.append("</br> <b>Categoria </b>" + categoria);
        sb.append("</br><b> Detalii produs </b>" + detalii);


        return sb.toString();
    }

    public String toStringFaraDet() {
        StringBuilder sb = new StringBuilder();
        sb.append("<img src=\"http://localhost:8080/Magazin/imag/" + urlPoza + "\" WIDTH=100 HEIGHT=100 align=left alt=poza/>");
        sb.append("</br><b> Produs </b>" + nume);
        sb.append("</br><b> Pret </b>" + String.valueOf(pret));
        sb.append("</br> <b>Categoria </b>" + categoria);
        sb.append("</br><a href=\"http://localhost:8080/Magazin/detaliiProdus.jsp?id=" + String.valueOf(id) + "\">Mai multe detalii aici </a>");
        sb.append("</br><a href=\"http://localhost:8080/Magazin/adaugaInCos.jsp?id=" + String.valueOf(id) + "\">Cumpar </a>");

        return sb.toString();
    }

     public String toStringCos() {
        StringBuilder sb = new StringBuilder();
        sb.append("<img src=\"http://localhost:8080/Magazin/imag/" + urlPoza + "\" WIDTH=100 HEIGHT=100 align=left alt=poza/>");
        sb.append("</br><b> Produs </b>" + nume);
        sb.append("</br><b> Pret </b>" + String.valueOf(pret));
        sb.append("</br> <b>Categoria </b>" + categoria);
        sb.append("</br><a href=\"http://localhost:8080/Magazin/detaliiProdus.jsp?id=" + String.valueOf(id) + "\">Mai multe detalii aici </a>");
         return sb.toString();
    }     
     
     public String toStringVandut() {
        StringBuilder sb = new StringBuilder();
        sb.append("<li></br><b> Produs </b>" + nume);
        sb.append("</br><b> Pret </b>" + String.valueOf(pret));
        sb.append("</br><a href=\"http://localhost:8080/Magazin/detaliiProdus.jsp?id=" + String.valueOf(id) + "\">Mai multe detalii aici </a>");
        sb.append("</br><a href=\"http://localhost:8080/Magazin/adaugaInCos.jsp?id=" + String.valueOf(id) + "\">Cumpar </a></li>");
        
        return sb.toString();
    }

    public String toStringCuD() throws SQLException {
        StringBuilder sb = new StringBuilder();
        sb.append("<img src=\"http://localhost:8080/Magazin/imag/" + urlPoza + "\" WIDTH=100 HEIGHT=100 align=left alt=poza/>");
        sb.append("</br><b> Produs </b>" + nume);
        sb.append("</br><b> Pret </b>" + String.valueOf(pret));
        sb.append("</br> <b>Categoria </b>" + categoria);
        sb.append("</br><b> Detalii produs </b>" + detalii);
        sb.append("</p>");
        return sb.toString();
    }
}
