/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package rmComponent.DBManagement;

import java.util.ArrayList;

public class Table {
    private String databaseName;
    private String tableName;
    private String fileName;
    private Index index;
    private int noOfRows;
    private ArrayList<String> primaryKey = new ArrayList<String>();
    private ForeignKey foreignKey;
    private ArrayList<Attribute> attributeList = new ArrayList<Attribute>();

    public Table(String databaseName, String tableName, String fileName, Index index, int noOfRows, ArrayList<String> primaryKey, ForeignKey foreignKey, ArrayList<Attribute> attributeList){
        this.databaseName = databaseName;
        this.tableName = tableName;
        this.fileName = fileName;
        this.index = index;
        this.noOfRows = noOfRows;
        this.primaryKey = primaryKey;
        this.foreignKey = foreignKey;
        this.attributeList = attributeList;
    }
    /**
     * @return the tableName
     */
    public String getTableName() {
        return tableName;
    }

    /**
     * @param tableName the tableName to set
     */
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    /**
     * @return the fileName
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param fileName the fileName to set
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * @return the indexFile
     */
    public Index getIndex() {
        return index;
    }

    /**
     * @param indexFile the indexFile to set
     */
    public void setIndex(Index index) {
        this.index = index;
    }

    /**
     * @return the noOfRows
     */
    public int getNoOfRows() {
        return noOfRows;
    }

    /**
     * @param noOfRows the noOfRows to set
     */
    public void setNoOfRows(int noOfRows) {
        this.noOfRows = noOfRows;
    }

    /**
     * @return the primaryKey
     */
    public ArrayList<String> getPrimaryKey() {
        return primaryKey;
    }

    /**
     * @param primaryKey the primaryKey to set
     */
    public void setPrimaryKey(ArrayList<String> primaryKey) {
        this.primaryKey = primaryKey;
    }

    /**
     * @return the foreignKey
     */
    public ForeignKey getForeignKey() {
        return foreignKey;
    }

    /**
     * @param foreignKey the foreignKey to set
     */
    public void setForeignKey(ForeignKey foreignKey) {
        this.foreignKey = foreignKey;
    }

    /**
     * @return the attributeList
     */
    public ArrayList<Attribute> getAttributeList() {
        return attributeList;
    }

    /**
     * @param attributeList the attributeList to set
     */
    public void setAttributeList(ArrayList<Attribute> attributeList) {
        this.attributeList = attributeList;
    }

    /**
     * @return the databaseName
     */
    public String getDatabaseName() {
        return databaseName;
    }

    /**
     * @param databaseName the databaseName to set
     */
    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }

}
