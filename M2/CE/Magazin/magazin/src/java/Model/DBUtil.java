package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Ovidiu
 */
public class DBUtil {

    private String tableName = "";
    private Connection conn;
    private String driverName = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/";
    private String bdName = "ce";
    private String user = "root";
    private String pass = "";

    public DBUtil() throws SQLException {
        try {

            Class.forName(driverName).newInstance();
            System.out.println(driverName);
            try {
                String uri = url + bdName + "?" + "user=" + user + "&password=" + pass;
                System.out.println("URL : " + uri);
                conn = DriverManager.getConnection(uri);

            } catch (SQLException ex) {
                System.out.println("Error");
            }
        } catch (InstantiationException ex) {
            System.out.println("Error");
        } catch (IllegalAccessException ex) {
            System.out.println("Error");
        } catch (ClassNotFoundException ex) {
            System.out.println("Error");
        }

    }

    public Connection getCon() {
        return conn;
    }

    public ArrayList<Produs> iaListaSpeciale() {

        ArrayList<Produs> spec = new ArrayList<Produs>();
        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT p.id,p.produs, p.detalii,p.urlpoza, c.denumire,p.pret FROM produse p join categorii c on p.idCategoria=c.id limit 3");
            while (rs.next()) {
                Produs p = new Produs(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getFloat(6));
                spec.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return spec;
    }

    public Produs iaProdus(String id) {

        Produs prod = null;
        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT p.id,p.produs, p.detalii,p.urlpoza, c.denumire,p.pret FROM produse p join categorii c on p.idCategoria=c.id where p.id=" + id);
            rs.next();
            prod = new Produs(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getFloat(6));


        } catch (SQLException e) {
            System.out.println("Error");
        }
        return prod;
    }

    public boolean adaugaProdus(String produs, String detalii, float pret, String url, int categoria){
        String add;
        
        add="insert into Produse(produs, detalii, urlpoza, idcategoria, pret) values ('"+produs+"','"+detalii+"','"+url+"','"+String.valueOf(categoria)+"','"+String.valueOf(pret)+"')";
        try {
            Statement stm = conn.createStatement();
            stm.executeUpdate(add);



        } catch (SQLException e) {
            System.out.println("Error");
            return false;
        }
        
        return true;
    }
    public ArrayList<Categorie> iaCategorii() {
        ArrayList<Categorie> cat = new ArrayList<Categorie>();
        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT max(c.id), max(c.denumire), count(*) from categorii c  LEFT join produse p on p.idCategoria= c.id group by c.id");
            while (rs.next()) {
                Categorie cat2 = new Categorie(rs.getString(2), rs.getString(1), rs.getString(3));
                cat.add(cat2);
            }


        } catch (SQLException e) {
            System.out.println("Error");
        }
        return cat;
    }

    public ArrayList<Produs> iaTopVandute() {
        ArrayList<Produs> spec = new ArrayList<Produs>();
        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT p.id,p.produs, p.detalii,p.urlpoza,p.idCategoria,p.pret FROM produse p LEFT join \n"
                    + "(select idprodus, count(*) nr from pozitiiComenzi \n"
                    + "group by idprodus order by 2 desc limit 5) as  c on c.idprodus= p.id limit 5");
            while (rs.next()) {
                Produs p = new Produs(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getFloat(6));
                spec.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return spec;
    }

    public ArrayList<Produs> iaProduseCat(String id) {
        ArrayList<Produs> spec = new ArrayList<Produs>();
        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT p.id,p.produs, p.detalii,p.urlpoza, c.denumire,p.pret FROM produse p join categorii c on p.idCategoria=c.id where p.idCategoria=" + id);
            while (rs.next()) {
                Produs p = new Produs(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getFloat(6));
                spec.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return spec;
    }

    public ArrayList<Produs> iaProduseLike(String cod) {
        ArrayList<Produs> spec = new ArrayList<Produs>();
        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT p.id,p.produs, p.detalii,p.urlpoza, c.denumire,p.pret FROM produse p join categorii c on p.idCategoria=c.id where p.produs like '%" + cod + "%' or c.denumire like '%" + cod + "%'");
            while (rs.next()) {
                Produs p = new Produs(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getFloat(6));
                spec.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error");
        }
        return spec;
    }
}