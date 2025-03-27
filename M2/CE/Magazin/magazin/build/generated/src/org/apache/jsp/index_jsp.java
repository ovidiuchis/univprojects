package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import Model.DBUtil;
import Model.Produs;
import java.util.ArrayList;
import Model.DBUtil;
import Model.Categorie;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/nav.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <title>Preturi</title>\n");
      out.write("        <meta name=\"description\" content=\"Aplicatie web\" />\n");
      out.write("        <link href=\"css/default.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("            ");
      out.write("<!-- Common Header for our site -->\n");
      out.write("<div id=\"header\">\n");
      out.write("    <div id=\"logo\">\n");
      out.write("        <h1><a href=\"index.jsp\">Preturi</a></h1>\n");
      out.write("        <h2><a href=\"index.jsp\">-Un proiect TPJAD-</a></h2>\n");
      out.write("    </div>\n");
      out.write("    <!-- end div#logo -->\n");
      out.write("    <div id=\"menu\">\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"index.jsp\">Acasa</a></li>\n");
      out.write("            <li><a href=\"cauta.jsp\">Cauta</a></li>\n");
      out.write("            <li><a href=\"despre.jsp\">Despre</a></li>\n");
      out.write("\n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("    <!-- end div#menu -->\n");
      out.write("</div>");
      out.write("\n");
      out.write("            <!-- end div#header -->\n");
      out.write("            <div id=\"page\">\n");
      out.write("                <div id=\"content\">\n");
      out.write("                    <div id=\"welcome\">\n");
      out.write("                        <h1>Bun venit</h1>\n");
      out.write("                        <!--body-->\n");
      out.write("                        <p>\n");
      out.write("                            Aici vei gasi un agregator de preturi de la diverse magazine si produse.\n");
      out.write("                        </p>\n");
      out.write("                        <p>\n");
      out.write("                            Cateva randuri mai jos sunt cele mai noi produse, cu ofertele speciale de care poti beneficia.\n");
      out.write("                        </p>\n");
      out.write("\n");
      out.write("                        ");
                     
                                    DBUtil bd = new DBUtil();
                                    ArrayList<Produs> spec = bd.iaListaSpeciale();
                                    if (spec != null) {                                        
                                        if (spec.size() > 0) {
                                            for (int i = 0; i < spec.size(); i++) {
                                                out.println("<p >");
                                                out.println(spec.get(i).toStringFaraDet());
                                                out.println("</p></br></br>");
                                            }
                                        }
                                    }
                        
      out.write("\n");
      out.write("\n");
      out.write("                        <!--body ends-->\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <!-- end div#welcome -->\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <!-- end div#content -->\n");
      out.write("                <div id=\"sidebar\">\n");
      out.write("                    <ul>\n");
      out.write("                        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<li id=\"submenu\">\n");
      out.write("    <h2>Categorii produse</h2>\n");
      out.write("    <ul>\n");
      out.write("        ");
 DBUtil bd2= new DBUtil();
            ArrayList<Categorie> list= bd2.iaCategorii();
            if (list !=null){
                for (int j=0;j< list.size();j++)
                    out.print(list.get(j).toString());
                }


                
      out.write("\n");
      out.write("    </ul>\n");
      out.write("</li>");
      out.write("\n");
      out.write("                        <!-- end navigation -->\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <!-- end div#sidebar -->\n");
      out.write("                <div style=\"clear: both; height: 1px\"></div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            ");
      out.write("<div id=\"footer\">\n");
      out.write("    <p id=\"legal\">Copyright &copy; 2012. Ovidiu CHIS, masterand BDI, an I</p>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <!-- end div#wrapper -->\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
