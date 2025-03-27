package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import Model.DBUtil;
import Model.Produs;

public final class detaliiProdus_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(3);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/nav.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
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
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

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
      out.write("            <li><a href=\"categorii.jsp\">Categorii</a></li>\n");
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
      out.write("\n");
      out.write("                        ");

                                    String id=request.getParameter("id");
                                    DBUtil bd = new DBUtil();
                                    Produs p = bd.iaProdus(id);
                                    if (p !=null)
                                        p.toString();
                        
      out.write("\n");
      out.write("                        </p>\n");
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
      out.write("<li id=\"submenu\">\n");
      out.write("    <h2>Selecteaza o optiune</h2>\n");
      out.write("    <ul>\n");
      out.write("        <li><a href=\"Categorii.jsp\">Vezi categorii</a></li>\n");
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
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
