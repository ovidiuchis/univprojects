/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rmComponent.DBManagement;

public class ForeignKey {

    private String name;
    private String refTable;
    private String refAttribute;

    public ForeignKey(String name, String refTable, String refAttribute) {
        this.name = name;
        this.refTable = refTable;
        this.refAttribute = refAttribute;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the refTable
     */
    public String getRefTable() {
        return refTable;
    }

    /**
     * @param refTable the refTable to set
     */
    public void setRefTable(String refTable) {
        this.refTable = refTable;
    }

    /**
     * @return the refAttribute
     */
    public String getRefAttribute() {
        return refAttribute;
    }

    /**
     * @param refAttribute the refAttribute to set
     */
    public void setRefAttribute(String refAttribute) {
        this.refAttribute = refAttribute;
    }

    public String toString() {
        return name + " " + refTable + " " + refAttribute;
    }
}
