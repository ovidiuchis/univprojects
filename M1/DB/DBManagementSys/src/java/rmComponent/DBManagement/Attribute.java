package rmComponent.DBManagement;
public class Attribute {
    private String name;
    private String type;
    private int length;
    private String value;
    private int isNull;
    private int isUnique;

    public Attribute(String name, String type, int length, String value) {
            this.name = name;
            this.type = type;
            this.length = length;
            this.value = value;
            isNull = 0;
    }
    public Attribute(String name, String type, int length, int isNull) {
            this.name = name;
            this.type = type;
            this.length = length;
            this.isNull = isNull;
    }
    /**
     * @return the name
     */
    public String getName() {//return the name
            return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
            this.name = name;
    }

    /**
     * @return the type
     */
    public String getType() {
            return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
            this.type = type;
    }

    /**
     * @return the length
     */
    public int getLength() {
            return length;
    }

    /**
     * @param length the length to set
     */
    public void setLength(int length) {
            this.length = length;
    }

    /**
     * @return the value
     */
    public String getValue() {
            return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(String value) {
            this.value = value;
    }

    /**
     * @return the isNull
     */
    public int getIsNull() {
        return isNull;
    }

    /**
     * @param isNull the isNull to set
     */
    public void setIsNull(int isNull) {
        this.isNull = isNull;
    }

    /**
     * @return the isUnique
     */
    public int getIsUnique() {
        return isUnique;
    }

    /**
     * @param isUnique the isUnique to set
     */
    public void setIsUnique(int isUnique) {
        this.isUnique = isUnique;
    }

    public String toString(){
        return name+"-"+type+"-"+length+"-"+isNull+"-"+isUnique;
    }
}