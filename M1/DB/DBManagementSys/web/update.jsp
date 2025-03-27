<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="rmComponent.CatalogManagement.*" %>
<%@ page import="indexComponent.BPlusindex.*" %>

<%
    String database = request.getSession().getAttribute("database2").toString();
    String table = request.getParameter("table");
    CatalogManager catalogReader = new CatalogManager();
    ArrayList<Attribute> attributeList = catalogReader.getFields(database, table);
    String fileName=catalogReader.getFileName(database, table);

    String x=table;

    bplusTest bpt = new bplusTest();
    bpt.tempdirectory = "C:/files/";
    bpt.fileName = x+".bin";
    bpt.rsFileName = x+".rs";
    bpt.db = database;
    bpt.table = table;
    bpt.makeIndexFiles=true;

    Iterator it = attributeList.iterator();
    while (it.hasNext()) {
        Attribute a = (Attribute) it.next();
	bpt.indexOnAttr = a.getName();
        bpt.indexFileName = x+"_"+bpt.indexOnAttr+".index";
        bpt.createIndexFile(bpt.indexOnAttr);
    }

    out.println("Index files updated!");
%>