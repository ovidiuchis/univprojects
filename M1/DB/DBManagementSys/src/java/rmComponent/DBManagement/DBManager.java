package rmComponent.DBManagement;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class DBManager {
    private DocumentBuilderFactory docBuilderFactory;
    DocumentBuilder docBuilder;
    Document doc;

    public DBManager() {
            try {
                    docBuilderFactory = DocumentBuilderFactory.newInstance();
                    docBuilder = docBuilderFactory.newDocumentBuilder();
                    doc = docBuilder.parse(new File("E:\\fisiere\\DataBases.xml"));
                    // normalize text representation
                    doc.getDocumentElement().normalize();
            } catch (SAXException ex) {
                    Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE,
                                    null, ex);
            } catch (IOException ex) {
                    Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE,
                                    null, ex);
            } catch (ParserConfigurationException ex) {
                    Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE,
                                    null, ex);
            }
    }

    public ArrayList<String> getDatabaseList() {
            ArrayList<String> databaseList = new ArrayList<String>();

            NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
            int noOfDatabases = listOfDatabases.getLength();

            for (int i = 0; i < noOfDatabases; i++) {
                    Element database = (Element) listOfDatabases.item(i);
                    databaseList.add(database.getAttribute("dataBaseName"));
            }
            return databaseList;
    }

    public ArrayList<String> getTables(String database) {
            NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
            int noOfDatabases = listOfDatabases.getLength();

            ArrayList<String> tableNames = new ArrayList<String>();

            for (int i = 0; i < noOfDatabases; i++) {
                    Element dbase = (Element) listOfDatabases.item(i);
                    String databaseName = dbase.getAttribute("dataBaseName");

                    if (databaseName.equals(database)) {
                            Element tablesTag = (Element) listOfDatabases.item(i);

                            NodeList listOfTables = tablesTag.getElementsByTagName("Table");
                            int noOfTables = listOfTables.getLength();

                            for (int j = 0; j < noOfTables; j++) {
                                    Element table = (Element) listOfTables.item(j);
                                    tableNames.add(table.getAttribute("tableName"));
                            }
                    }
            }
            return tableNames;
    }

    public ArrayList<Attribute> getFields(String database, String table2) {
            ArrayList<Attribute> attributeList = new ArrayList<Attribute>();

            NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
            int noOfDatabases = listOfDatabases.getLength();

            for (int i = 0; i < noOfDatabases; i++) {
                    Element dbase = (Element) listOfDatabases.item(i);
                    String databaseName = dbase.getAttribute("dataBaseName");

                    if (databaseName.equals(database)) {
                            Element tablesTag = (Element) listOfDatabases.item(i);

                            NodeList listOfTables = tablesTag.getElementsByTagName("Table");
                            int noOfTables = listOfTables.getLength();

                            for (int j = 0; j < noOfTables; j++) {
                                    Element table = (Element) listOfTables.item(j);
                                    String tableName = table.getAttribute("tableName");
                                    if (tableName.equals(table2)) {
                                            Element structureTag = (Element) listOfTables.item(j);

                                            NodeList listOfAttributes = structureTag
                                                            .getElementsByTagName("Attribute");
                                            int noOfAttributes = listOfAttributes.getLength();

                                            for (int k = 0; k < noOfAttributes; k++) {
                                                    Element attribute = (Element) listOfAttributes
                                                                    .item(k);
                                                    String attributeName = attribute
                                                                    .getAttribute("attributeName");
                                                    String attributeType = attribute
                                                                    .getAttribute("type");
                                                    int attributeLength = Integer.parseInt(attribute
                                                                    .getAttribute("length"));

                                                    Attribute attrib = new Attribute(attributeName,
                                                                    attributeType, attributeLength, null);
                                                    attributeList.add(attrib);
                                            }
                                    }
                            }
                    }
            }
            return attributeList;
    }

    public ArrayList<String> getAllFieldNames(String database) {
            ArrayList<String> attributeList = new ArrayList<String>();

            NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
            int noOfDatabases = listOfDatabases.getLength();

            for (int i = 0; i < noOfDatabases; i++) {
                    Element dbase = (Element) listOfDatabases.item(i);
                    String databaseName = dbase.getAttribute("dataBaseName");

                    if (databaseName.equals(database)) {
                            Element tablesTag = (Element) listOfDatabases.item(i);

                            NodeList listOfTables = tablesTag.getElementsByTagName("Table");
                            int noOfTables = listOfTables.getLength();

                            for (int j = 0; j < noOfTables; j++) {
                                    Element table = (Element) listOfTables.item(j);
                                    String tableName = table.getAttribute("tableName");

                                            Element structureTag = (Element) listOfTables.item(j);

                                            NodeList listOfAttributes = structureTag
                                                            .getElementsByTagName("Attribute");
                                            int noOfAttributes = listOfAttributes.getLength();

                                            for (int k = 0; k < noOfAttributes; k++) {
                                                    Element attribute = (Element) listOfAttributes
                                                                    .item(k);
                                                    String attributeName = attribute
                                                                    .getAttribute("attributeName");

                                                    attributeList.add(attributeName);
                                            }

                            }
                    }
            }
            return attributeList;
    }

    public String getFileName(String database, String table) {
            NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
            int noOfDatabases = listOfDatabases.getLength();

            for (int i = 0; i < noOfDatabases; i++) {
                    Element dbase = (Element) listOfDatabases.item(i);
                    String databaseName = dbase.getAttribute("dataBaseName");

                    if (databaseName.equals(database)) {
                            Element tablesTag = (Element) listOfDatabases.item(i);

                            NodeList listOfTables = tablesTag.getElementsByTagName("Table");
                            int noOfTables = listOfTables.getLength();

                            for (int j = 0; j < noOfTables; j++) {
                                    Element tab = (Element) listOfTables.item(j);
                                    if (tab.getAttribute("tableName").equals(table))
                                        return tab.getAttribute("fileName");
                            }
                    }
            }
            return null;
    }

    public void updateRowNo(String database, String table, int no){
      BufferedWriter bw = null;
      try {
        NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
        int noOfDatabases = listOfDatabases.getLength();

        for (int i=0;i<noOfDatabases;i++){
            Element databaseTag = (Element) listOfDatabases.item(i);
            if (databaseTag.getAttribute("dataBaseName").equals(database)){

                 NodeList tableTagL = databaseTag.getElementsByTagName("Table");
                 for (int j=0;j<tableTagL.getLength();j++){
                     Element tableTag = (Element)tableTagL.item(j);
                     if (tableTag.getAttribute("tableName").equals(table)){
                        tableTag.setAttribute("rowLength", no+"");
                     }
                 }

                TransformerFactory transfac = TransformerFactory.newInstance();
                Transformer trans = transfac.newTransformer();
                trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
                trans.setOutputProperty(OutputKeys.INDENT, "yes");
                StringWriter sw = new StringWriter();
                StreamResult result = new StreamResult(sw);
                DOMSource source = new DOMSource(doc);
                trans.transform(source, result);
                String xmlString = sw.toString();

                bw = new BufferedWriter(new FileWriter("E:\\fisiere\\DataBases.xml"));
                bw.write(xmlString);
                bw.flush();
                bw.close();
                System.out.println("Here's the xml:\n\n" + xmlString);
            }
        }
    } catch (TransformerException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
    }

    }

    public Index getIndex(String database, String table2){

            NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
            int noOfDatabases = listOfDatabases.getLength();

            for (int i = 0; i < noOfDatabases; i++) {
                    Element dbase = (Element) listOfDatabases.item(i);
                    String databaseName = dbase.getAttribute("dataBaseName");

                    if (databaseName.equals(database)) {
                            Element tablesTag = (Element) listOfDatabases.item(i);

                            NodeList listOfTables = tablesTag.getElementsByTagName("Table");
                            int noOfTables = listOfTables.getLength();

                            for (int j = 0; j < noOfTables; j++) {
                                    Element table = (Element) listOfTables.item(j);
                                    String tableName = table.getAttribute("tableName");
                                    if (tableName.equals(table2)) {
                                            Element indexFilesTag = (Element) listOfTables.item(j);

                                            NodeList listOfIndexFile = indexFilesTag
                                                            .getElementsByTagName("IndexFile");

                                            Element index = (Element) listOfIndexFile
                                                                    .item(0);
                                            String indexName = index.getAttribute("indexName");
                                            int keyLength = Integer.parseInt(index
                                                                    .getAttribute("keyLength"));

                                            NodeList indexAttList = indexFilesTag.getElementsByTagName("IAttribute");
                                            int noOfAttr = indexAttList.getLength();

                                            ArrayList<String> indexAtt = new ArrayList<String>();

                                            for (int p=0;p<noOfAttr;p++){
                                                Element indexAttTag =(Element) indexAttList.item(p);
                                                indexAtt.add(indexAttTag.getTextContent());
                                            }
                                            Index index2 = new Index(indexName,keyLength, indexAtt);
                                            return index2;

                                      }
                            }
                    }
            }
        return null;
    }

    ArrayList<String> getPrimaryKey(String database,String table2){
            NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
            int noOfDatabases = listOfDatabases.getLength();

            for (int i = 0; i < noOfDatabases; i++) {
                    Element dbase = (Element) listOfDatabases.item(i);
                    String databaseName = dbase.getAttribute("dataBaseName");

                    if (databaseName.equals(database)) {
                            Element tablesTag = (Element) listOfDatabases.item(i);

                            NodeList listOfTables = tablesTag.getElementsByTagName("Table");
                            int noOfTables = listOfTables.getLength();

                            for (int j = 0; j < noOfTables; j++) {
                                    Element table = (Element) listOfTables.item(j);
                                    String tableName = table.getAttribute("tableName");
                                    if (tableName.equals(table2)) {
                                            Element tableFilesTag = (Element) listOfTables.item(j);

                                            NodeList listOfPrimaryKey = tableFilesTag
                                                            .getElementsByTagName("pkAttribute");
                                           int noOfPrimaryKey = listOfPrimaryKey.getLength();

                                            ArrayList<String> primaryKeyList = new ArrayList<String>();

                                            for (int p=0;p<noOfPrimaryKey;p++){
                                                Element fkAttTag =(Element) listOfPrimaryKey.item(p);
                                                primaryKeyList.add(fkAttTag.getTextContent());
                                            }
                                             return primaryKeyList;
                                      }
                            }
                    }
            }
        return null;
    }

    public  ForeignKey getForeignKey(String database,String table2){
            NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
            int noOfDatabases = listOfDatabases.getLength();

            for (int i = 0; i < noOfDatabases; i++) {
                    Element dbase = (Element) listOfDatabases.item(i);
                    String databaseName = dbase.getAttribute("dataBaseName");

                    if (databaseName.equals(database)) {
                            Element tablesTag = (Element) listOfDatabases.item(i);

                            NodeList listOfTables = tablesTag.getElementsByTagName("Table");
                            int noOfTables = listOfTables.getLength();

                            for (int j = 0; j < noOfTables; j++) {
                                    Element table = (Element) listOfTables.item(j);
                                    String tableName = table.getAttribute("tableName");
                                    if (tableName.equals(table2)) {
                                            Element tableFilesTag = (Element) listOfTables.item(j);

                                            NodeList listOfForeignKey = tableFilesTag
                                                            .getElementsByTagName("fkAttribute");
                                            NodeList listOfRefTables = tableFilesTag.getElementsByTagName("refTable");
                                            NodeList listOfRefAttr = tableFilesTag.getElementsByTagName("refAttribute");

                                            int noOfForeignKey = listOfForeignKey.getLength();

                                            if (noOfForeignKey>0){
                                                ArrayList<String> fkKeyList = new ArrayList<String>();

                                                Element fkAttTag =(Element) listOfForeignKey.item(0);
                                                Element refTable = (Element) listOfRefTables.item(0);
                                                Element refAttr = (Element) listOfRefAttr.item(0);

                                                ForeignKey fk= new ForeignKey(fkAttTag.getTextContent(),refTable.getTextContent(),refAttr.getTextContent());
                                                return fk;
                                            }
                                  }
                            }
                    }
         }

        return null;
      }

    public void insertDatabase(String database) throws TransformerConfigurationException, TransformerException{
    BufferedWriter bw = null;
    try {
        NodeList listOfDatabases = doc.getElementsByTagName("Databases");
        int noOfDatabases = listOfDatabases.getLength();
        Element lastDatabase = (Element) listOfDatabases.item(noOfDatabases-1);
        Element newDB = doc.createElement("DataBase");
        newDB.setAttribute("dataBaseName", database);
		Element newTablesTag = doc.createElement("Tables");
        newDB.appendChild(newTablesTag);

        lastDatabase.appendChild(newDB);
        TransformerFactory transfac = TransformerFactory.newInstance();
        Transformer trans = transfac.newTransformer();
        trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        trans.setOutputProperty(OutputKeys.INDENT, "yes");
        StringWriter sw = new StringWriter();
        StreamResult result = new StreamResult(sw);
        DOMSource source = new DOMSource(doc);
        trans.transform(source, result);
        String xmlString = sw.toString();

        bw = new BufferedWriter(new FileWriter("E:\\fisiere\\DataBases.xml"));
        bw.write(xmlString);
        bw.flush();
        bw.close();
        System.out.println("Here's the xml:\n\n" + xmlString);
    } catch (IOException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);

    }
    }

    public void insertTable(Table table){
          BufferedWriter bw = null;
    try {
        NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
        int noOfDatabases = listOfDatabases.getLength();

        for (int i=0;i<noOfDatabases;i++){
            Element databaseTag = (Element) listOfDatabases.item(i);
            if (databaseTag.getAttribute("dataBaseName").equals(table.getDatabaseName())){
				Element currentDB = (Element) listOfDatabases.item(i);
                NodeList tablesTagList = currentDB.getElementsByTagName("Tables");


                 Element tablesTag = (Element)tablesTagList.item(0);
                 //tablesTag.appendChild(newTablesTag);

                 Element newTableTag = doc.createElement("Table");
                 newTableTag.setAttribute("fileName", table.getFileName());
                 newTableTag.setAttribute("rowLength",table.getNoOfRows()+"");
                 newTableTag.setAttribute("tableName", table.getTableName());
                 tablesTag.appendChild(newTableTag);

                 Element newStructureTag = doc.createElement("Structure");
                 newTableTag.appendChild(newStructureTag);

                 for (int j=0;j<table.getAttributeList().size();j++){
                     Element attributeTag = doc.createElement("Attribute");
                     attributeTag.setAttribute("attributeName", table.getAttributeList().get(j).getValue());
                     attributeTag.setAttribute("attributeName", table.getAttributeList().get(j).getName());
                     attributeTag.setAttribute("isNull", table.getAttributeList().get(j).getIsNull()+"");
                     attributeTag.setAttribute("length", table.getAttributeList().get(j).getLength()+"");
                     attributeTag.setAttribute("type", table.getAttributeList().get(j).getType());

                     newStructureTag.appendChild(attributeTag);
                 }

                 if (table.getPrimaryKey()!=null){
                 Element newPrimaryKeyTag = doc.createElement("primaryKey");
                 newTableTag.appendChild(newPrimaryKeyTag);

                 for (int k=0; k<table.getPrimaryKey().size();k++){
                     Element newPkAttTag = doc.createElement("pkAttribute");
                     newPkAttTag.setTextContent(table.getPrimaryKey().get(k));

                     newPrimaryKeyTag.appendChild(newPkAttTag);
                 }
                 }
                 if (table.getForeignKey()!=null){
                 Element newForeignKeysTag = doc.createElement("foreignKeys");
                 newTableTag.appendChild(newForeignKeysTag);

                 Element newForeignKeyTag = doc.createElement("foreignKey");
                 newForeignKeysTag.appendChild(newForeignKeyTag);

                 Element newFkAttr = doc.createElement("fkAttribute");
                 newFkAttr.setTextContent(table.getForeignKey().getName());
                 newForeignKeyTag.appendChild(newFkAttr);

                 Element newReferencesTag = doc.createElement("references");
                 newForeignKeyTag.appendChild(newReferencesTag);

                 Element newRefTableTag = doc.createElement("refTable");
                 newRefTableTag.setTextContent(table.getForeignKey().getRefTable());
                 newReferencesTag.appendChild(newRefTableTag);

                 Element newRefAttrTag = doc.createElement("refAttribute");
                 newRefAttrTag.setTextContent(table.getForeignKey().getRefAttribute());
                 newReferencesTag.appendChild(newRefAttrTag);
                 }

                 if (table.getIndex()!=null){
                 Element newIndexFilesTag = doc.createElement("IndexFiles");
                 newTableTag.appendChild(newIndexFilesTag);

                 Element newIndexFileTag = doc.createElement("IndexFile");
                 newIndexFileTag.setAttribute("indexName", table.getIndex().getFileName());
                 newIndexFileTag.setAttribute("indexType", "BTree");
                 newIndexFileTag.setAttribute("isUnique", "0");
                 newIndexFileTag.setAttribute("keyLength", table.getIndex().getKeyLength()+"");

                 newIndexFilesTag.appendChild(newIndexFileTag);

                 Element newIndexAttrTag = doc.createElement("IndexAttributes");
                 newIndexFileTag.appendChild(newIndexAttrTag);

                 for (int p=0;p<table.getIndex().getIndexAttributes().size();p++){
                     Element newIAttr = doc.createElement("IAttribute");
                     newIAttr.setTextContent(table.getIndex().getIndexAttributes().get(p));

                     newIndexAttrTag.appendChild(newIAttr);
                 }
                 }
				tablesTag.appendChild(newTableTag);
                TransformerFactory transfac = TransformerFactory.newInstance();
                Transformer trans = transfac.newTransformer();
                trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
                trans.setOutputProperty(OutputKeys.INDENT, "yes");
                StringWriter sw = new StringWriter();
                StreamResult result = new StreamResult(sw);
                DOMSource source = new DOMSource(doc);
                trans.transform(source, result);
                String xmlString = sw.toString();

                bw = new BufferedWriter(new FileWriter("E:\\fisiere\\DataBases.xml"));
                bw.write(xmlString);
                bw.flush();
                bw.close();
                System.out.println("Here's the xml:\n\n" + xmlString);
            }
        }
    } catch (TransformerException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
    }
  }



    public void deleteDatabase(String database){

    BufferedWriter bw = null;
    try {
        NodeList databases = doc.getElementsByTagName("Databases");
        Element db = (Element) databases.item(0);
        NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
        int noOfDatabases = listOfDatabases.getLength();

        for (int i=0;i<noOfDatabases;i++){
            Element dataBase = (Element)listOfDatabases.item(i);
            if (dataBase.getAttribute("dataBaseName").equals(database)) {
                db.removeChild(dataBase);
            }
        }

        TransformerFactory transfac = TransformerFactory.newInstance();
        Transformer trans = transfac.newTransformer();
        trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        trans.setOutputProperty(OutputKeys.INDENT, "yes");
        StringWriter sw = new StringWriter();
        StreamResult result = new StreamResult(sw);
        DOMSource source = new DOMSource(doc);
        trans.transform(source, result);
        String xmlString = sw.toString();

        bw = new BufferedWriter(new FileWriter("E:\\fisiere\\DataBases.xml"));
        bw.write(xmlString);
        bw.flush();
        bw.close();
        System.out.println("Here's the xml:\n\n" + xmlString);
    } catch (TransformerException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    public void deleteTable(String database, String table){
     BufferedWriter bw = null;
    try {
        NodeList databases = doc.getElementsByTagName("Databases");
        Element db = (Element) databases.item(0);
        NodeList listOfDatabases = doc.getElementsByTagName("DataBase");
        int noOfDatabases = listOfDatabases.getLength();

        for (int i=0;i<noOfDatabases;i++){
            Element dataBaseTag = (Element)listOfDatabases.item(i);
            if (dataBaseTag.getAttribute("dataBaseName").equals(database)) {
                NodeList tableList = dataBaseTag.getElementsByTagName("Tables");

                for (int j=0;j<tableList.getLength();j++){
                    Element tableTag = (Element) tableList.item(j);
                    NodeList tabList = tableTag.getElementsByTagName("Table");
                    for (int k=0;k<tabList.getLength();k++){
                        Element tabTag = (Element) tabList.item(k);
                        if (tabTag.getAttribute("tableName").equals(table)){
                            tableTag.removeChild(tabTag);
                        }
                    }

                }
            }
        }

        TransformerFactory transfac = TransformerFactory.newInstance();
        Transformer trans = transfac.newTransformer();
        trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        trans.setOutputProperty(OutputKeys.INDENT, "yes");
        StringWriter sw = new StringWriter();
        StreamResult result = new StreamResult(sw);
        DOMSource source = new DOMSource(doc);
        trans.transform(source, result);
        String xmlString = sw.toString();

        bw = new BufferedWriter(new FileWriter("E:\\fisiere\\DataBases.xml"));
        bw.write(xmlString);
        bw.flush();
        bw.close();
        System.out.println("Here's the xml:\n\n" + xmlString);
    } catch (TransformerException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
        Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    public boolean isPrimaryKey(String database, String table, String field){
        if (getPrimaryKey(database, table).contains(field)) return true;
        return false;
    }

     public boolean isForeignKey(String database, String table, String field){

            ForeignKey fk = getForeignKey(database, table);
            if (fk!=null)
                if (fk.getName().equals(field)) return true;

        return false;
    }
        
}