/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ovidiu Chis
 */
public class DatabaseUtils {

    private Connection con;

    public DatabaseUtils(Connection c) {
        this.con = c;
    }

    public void addAnunt(String t, String p, String d) {
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("insert into anunturi values('" + t + "','" + p + "','" + d + "')");
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addAlert(String c, String v, String client) {
        try {
            System.err.println("Client add alerte" + client);
            Statement stmt = con.createStatement();
            stmt.executeUpdate("insert into alerte values('" + c + "','" + v + "','" + client + "')");
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getAnunturi(String c, String v) {
        StringBuilder sb = new StringBuilder();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select tara, pret, durata from anunturi where " + c + " like '%" + v + "%'");
            while (rs.next()) {
                sb.append("<b> Tara: </b>").append(rs.getString(1)).append("</br>");
                sb.append("<b> Cost:</b>").append(rs.getString(2)).append("</br>");
                sb.append("<b> Durata: </b>").append(rs.getString(3)).append("</br>").append("<hr>");
            }
            stmt.close();
            return sb.toString();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public String getAnunturiClient(String c) {
        StringBuilder sb = new StringBuilder();
        sb.append("<hr>");
        try {
            Statement stmt = con.createStatement();
            Statement st = con.createStatement();
            System.err.println("Client cauta alerte" + c);
            ResultSet rss = stmt.executeQuery("select camp, valoare from alerte where client like '%" + c + "%'");
            while (rss.next()) {
                String cmp = rss.getString(1);
                String val = rss.getString(2);
                ResultSet rs = st.executeQuery("select tara, pret, durata from anunturi where " + cmp + " like '%" + val + "%'");
                while (rs.next()) {
                    sb.append("<b> Tara: </b>").append(rs.getString(1)).append("</br>");
                    sb.append("<b> Cost:</b>").append(rs.getString(2)).append("</br>");
                    sb.append("<b> Durata: </b>").append(rs.getString(3)).append("</br>").append("<hr>");
                }
            }

            st.close();
            stmt.close();

            return sb.toString();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseUtils.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }
    private static final Logger LOG = Logger.getLogger(DatabaseUtils.class.getName());
}
