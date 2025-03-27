/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 * @author Ovidiu Chis
 */
public class Initializer implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        System.err.println("Start.");
        ServletContext application = sce.getServletContext();
        String dataBaseURL = application.getInitParameter("dburl");
        String dataBaseUser = application.getInitParameter("dbuser");
        String dataBasePassword = application.getInitParameter("dbpass");
        String driver = application.getInitParameter("driver");
        String anunturi = application.getInitParameter("anunturiTable");
        String alerte = application.getInitParameter("alerteTable");

        try {
            Class.forName(driver).newInstance();
            Connection con = DriverManager.getConnection(dataBaseURL, dataBaseUser, dataBasePassword);
            application.setAttribute("conexiune", con);
            System.err.println("Conexiunea la baza de date creata cu succes.");
        } catch (Exception e) {
            System.err.println("Eroare la obtinere conexiune");
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        System.err.println("Stop");
        ServletContext application = sce.getServletContext();        
        Connection con = (Connection) application.getAttribute("conexiune");
        try {
            con.close();
        } catch (Exception e) {
            System.err.println("Eroare la inchidere conexiune");
        }
    }
}
