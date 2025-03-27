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

    public Produs(int id, String nume, String detalii, String url, String categoria) {
        this.detalii = detalii;
        this.id = id;
        this.nume = nume;
        this.categoria = categoria;
        this.urlPoza = url;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("<img src=\"http://localhost:8080/Preturi/imag/" + urlPoza + "\" WIDTH=100 HEIGHT=100 align=left alt=poza/>");
        sb.append("</br><b> Produs </b>" + nume);
        sb.append("</br> <b>Categoria </b>" + categoria);
        sb.append("</br><b> Detalii produs </b>" + detalii);


        return sb.toString();
    }

    public String toStringFaraDet() {
        StringBuilder sb = new StringBuilder();
        sb.append("<img src=\"http://localhost:8080/Preturi/imag/" + urlPoza + "\" WIDTH=100 HEIGHT=100 align=left alt=poza/>");
        sb.append("</br><b> Produs </b>" + nume);
        sb.append("</br> <b>Categoria </b>" + categoria);
        sb.append("</br><a href=\"http://localhost:8080/Preturi/detaliiProdus.jsp?id=" + String.valueOf(id) + "\"> Mai multe detalii aici </a>");

        return sb.toString();
    }

    public String scrieCuOferte() throws SQLException {
        StringBuilder sb = new StringBuilder();
        sb.append("<img src=\"http://localhost:8080/Preturi/imag/" + urlPoza + "\" WIDTH=100 HEIGHT=100 align=left alt=poza/>");
        sb.append("</br><b> Produs </b>" + nume);
        sb.append("</br> <b>Categoria </b>" + categoria);
        sb.append("</br><b> Detalii produs </b>" + detalii);

        sb.append("</br><p><b> Oferte </b>");
        sb.append(this.iaOferte());
        sb.append("</p>");
        return sb.toString();
    }

    public String iaOferte() throws SQLException{

         StringBuilder sb = new StringBuilder();
         DBUtil db = new DBUtil();
         Connection conn= db.getCon();
        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select o.pret, DATE_FORMAT(o.data, '%d %m %Y'), m.denumire,m.website from oferte o join magazine m on m.id=o.idMagazin and o.idProdus=" + id +" order by data");
            while (rs.next()) {
                sb.append("</br> <b> Magazin </b>"+ rs.getString(3));
                sb.append("</br> <b><a href=\""+rs.getString(4)+"\"> Website </a></b>" );
                sb.append("</br><b> Pret </b>"+ rs.getDouble(1));
                sb.append("</br><b> Data </b>"+ rs.getString(2));
                sb.append("<hr>");

                sb.append("</br>");
                
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return sb.toString();

    }
}
