import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ApplicationManagement implements ServletContextListener {


  public void contextInitialized(ServletContextEvent sce) {
    System.err.println("Se porneste aplicatia web.");
    ServletContext application = sce.getServletContext();
    String dataBaseURL = application.getInitParameter("DataBaseURL");
    String dataBaseUser = application.getInitParameter("DataBaseUser");
    String dataBasePassword = application.getInitParameter("DataBasePassword");
    String driver = application.getInitParameter("Driver");
    
    try {
      Class.forName(driver);
      Connection con = DriverManager.getConnection(dataBaseURL, dataBaseUser, dataBasePassword);
      application.setAttribute("conexiune", con);
      System.err.println("Conexiunea la baza de date creata cu succes.");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  
  public void contextDestroyed(ServletContextEvent sce) {
    System.err.println("Se opreste executia aplicatiei Web.");
    ServletContext application = sce.getServletContext();
    Connection con = (Connection) application.getAttribute("conexiune");
    try {
      con.close();
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}
