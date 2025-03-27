/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package rmComponent.DBManagement;

import java.util.ArrayList;

public class Index {

    private String fileName;
    private int keyLength;
    private ArrayList<String> indexAttributes = new ArrayList<String>();

    public Index(String fileName, int keyLength, ArrayList<String> indexAttributes) {
        this.fileName = fileName;
        this.keyLength = keyLength;
        this.indexAttributes = indexAttributes;
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
     * @return the keyLength
     */
    public int getKeyLength() {
        return keyLength;
    }

    /**
     * @param keyLength the keyLength to set
     */
    public void setKeyLength(int keyLength) {
        this.keyLength = keyLength;
    }

    /**
     * @return the indexAttributes
     */
    public ArrayList<String> getIndexAttributes() {
        return indexAttributes;
    }

    /**
     * @param indexAttributes the indexAttributes to set
     */
    public void setIndexAttributes(ArrayList<String> indexAttributes) {
        this.indexAttributes = indexAttributes;
    }
}
