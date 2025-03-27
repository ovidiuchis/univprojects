package rmComponent.binFileManagement;

import java.io.*;
import java.util.*;
import rmComponent.DBManagement.*;

public class BinFileManager {
    public byte[] recordStatus = new byte[0];
    public String fileName;
    public String rsFileName;
    public String indexFileName;
    public ArrayList<Attribute> attr;
    public String database;
    public String table;
    public String dir="E:/fisiere/";
	static Map<Integer,String[]> file_content=null;

    public BinFileManager(){

    }
    
    public BinFileManager(String database, String table){
        this.database=database;
        this.table=table;
        fileName=dir+table+".kv";
        rsFileName = dir+table+".rs";
        indexFileName =dir + table + ".index";
        DBManager cm = new DBManager();
        attr = cm.getFields(database, table);
    }

    
    public int createTable() {
            File f = new File(fileName);

            try {
                    if (!f.exists())
                            f.createNewFile();
                    else
                            return 0;
            } catch (IOException e) {
                    e.printStackTrace();
                    return 0;
            }

            return 1;
    }

    // FIS
    public int dropTable(String file_name){
            File f=new File(dir+file_name);

            if (f.exists())
                    f.delete();
            else
                    return 0;

            return 1;
    }

    // citesc sirul de biti 0 sau 1 de pe prima linie din fisier;
    public void getRecordStatus() {
        try {
                RandomAccessFile f = new RandomAccessFile(rsFileName, "r");
                // citeste pana la '\n';
                // 01001010101000010 ca String -> byte[];
                recordStatus = f.readLine().getBytes();
        } catch (FileNotFoundException e) {
        } catch (IOException e) {
                e.printStackTrace();
        } catch (NullPointerException e) {
        }
    }

    private void setRecordStatus(int rids[], String mode) {
        try {
            RandomAccessFile f = new RandomAccessFile(rsFileName, "rw");
            f.seek(0);

            if (mode.equals("delete")) {
                for (int i = 0; i < rids.length; i++)
                        recordStatus[rids[i]-1] = 1;
            } else if (mode.equals("insert")) {// insert;
                for (int i = 0; i < rids.length; i++)
                        recordStatus[rids[i]] = 0; // pt ca porneste de la 0;
            } else if (mode.equals("new")) {// insert new record in file; rid++;
                byte[] rs;
                try {
                        rs = new byte[recordStatus.length + 1];
                        for (int i = 0; i < recordStatus.length; i++)
                                rs[i] = recordStatus[i];
                        rs[recordStatus.length] = 0;
                        recordStatus = rs;
                } catch (NullPointerException e) { // daca inca nu am nici o
                        // inregistrare;
                        rs = new byte[1];
                        rs[0] = 0;
                        recordStatus = rs;
                }
            }

            f.write(recordStatus);
            // f.write('\n');
        } catch (FileNotFoundException e) {
                e.printStackTrace();
        } catch (IOException e) {
                e.printStackTrace();
        } catch (NullPointerException e) {
        }
    }

    public int getRecordLength() {
        int record_length = 0;
        Iterator it = attr.iterator();
        while (it.hasNext()) {
                Attribute a = (Attribute) it.next();
                record_length += a.getLength();
        }
        return record_length;
    }


    public long insertRecord(String[] data) {
        // parcurg prima linie din fisier, caut prima inregistrare stearsa si
        // copiez noua
        // inregistrare peste ea, pastrandu-i RID;

        System.out.print("fileName"+fileName);

        long pos = 0, rid = 0;
        int record_length = getRecordLength();

        try {
                RandomAccessFile f = new RandomAccessFile(fileName, "rw");

                getRecordStatus(); // citeste din files/rs_file_name.bin si seteaza
                // variabila record_status;

                // f.seek(record_status.length+1);
                f.seek(0);

                boolean isDeletedRow = false;

                for (int i = 0; i < recordStatus.length; i++) { // all records;
                    if (recordStatus[i] == 1) {
                            long pos1 = /* record_status.length+1 + */(9 + record_length)
                                            * i; // 8 (long) + 1 ('\n');
                            f.seek(pos1);
                            rid = f.readLong(); // citeste 8 biti;
                            
                            int rids[] = { i };
                            setRecordStatus(rids, "insert");

                            isDeletedRow = true;

                            break; // iese din for, continua la if...

                    }
                }

                if (!isDeletedRow) {
                    f.seek(f.length()); // pozitionare la sfarsitul fisierului;
                    rid = recordStatus.length + 1;
                    f.writeLong(rid);
                    int rids[] = { 0 };
                    setRecordStatus(rids, "new");
                }

                for (int j = 0; j < data.length; j++) {
                    Attribute a = (Attribute) attr.get(j);
                    String type = a.getType();
                    int size = a.getLength();

                    if (type.contains("byte"))
                            f.writeByte(Byte.parseByte(data[j]));
                    else if (type.contains("int"))
                            f.writeInt(Integer.parseInt(data[j]));
                    else if (type.contains("double"))
                            f.writeDouble(Double.parseDouble(data[j]));
                    else if (type.contains("float"))
                            f.writeFloat(Float.parseFloat(data[j]));
                    else if (type.contains("long"))
                            f.writeLong(Long.parseLong(data[j]));
                    else if (type.contains("short"))
                            f.writeShort(Short.parseShort(data[j]));
                    else if (type.contains("char") || type.contains("varchar") || type.contains("date")) {
                            f.write(data[j].getBytes()); // scriu cele k<=n caractere;
                            // daca k<n atunci completez cu " ";
                            int k = data[j].length();
                            while (k < size) {
                                    f.write(' ');
                                    k++;
                            }
                    }
            }// for;
            f.write('\n');
        } catch (IOException e) {
                e.printStackTrace();
        }

        DBManager cat = new DBManager();
        cat.updateRowNo(database, table, getNoOfRecords());

        return rid;
    }

    public int getNoOfRecords(){
        int nr=0;
        for (int i=0;i<recordStatus.length;i++)
            if (recordStatus[i]==0) nr++;
        return nr;
    }

    // select * from ... returneaza inregistrarile care nu sunt sterse;

    public ArrayList<String[]> selectRecords() {
        ArrayList<String[]> records = new ArrayList<String[]>();
        long pos = 0;
        int record_length = getRecordLength();

        try {
            RandomAccessFile f = new RandomAccessFile(fileName, "r");
            getRecordStatus();
            f.seek(0);

            for (int i = 0; i < recordStatus.length; i++) { // all records;
                if (recordStatus[i] == 0) {
                        pos = (9 + record_length) * i;
                        f.seek(pos);

                        long rid = f.readLong();
                        String[] r = new String[attr.size() + 1]; // rid+atributele;
                        r[0] = "rid = " + rid;

                        int last_index = 0, j = 1;
                        Iterator it = attr.iterator();
                        while (it.hasNext()) {
                                Attribute a = (Attribute) it.next();
                                String type = a.getType();
                                int size = a.getLength();

                                if (type.contains("byte"))
                                        r[j] = f.readByte() + "";
                                else if (type.contains("int"))
                                        r[j] = f.readInt() + "";
                                else if (type.contains("double"))
                                        r[j] = f.readDouble() + "";
                                else if (type.contains("float"))
                                        r[j] = f.readFloat() + "";
                                else if (type.contains("long"))
                                        r[j] = f.readLong() + "";
                                else if (type.contains("short"))
                                        r[j] = f.readShort() + "";
                                else if (type.contains("char")
                                                || type.contains("varchar") || type.contains("date")) {
                                        String st = "";
                                        char c;
                                        for (int k = 0; k < size; k++) {
                                                c = (char) f.read();
                                                st += c;
                                        }
                                        r[j] = st;
                                }
                                j++;
                        }
                        records.add(r);
                }
            }
        } catch (Exception e) {
                //e.printStackTrace();
        }
        return records;
    }

    public ArrayList<String[]> getRecords(String key, String value){
        ArrayList<String[]> records = new ArrayList<String[]>();
        long pos = 0;
        int record_length = getRecordLength();

        try {
            RandomAccessFile f = new RandomAccessFile(fileName, "r");
            getRecordStatus();
            f.seek(0);

            for (int i = 0; i < recordStatus.length; i++) { // all records;
                if (recordStatus[i] == 0) {
                    pos = (9 + record_length) * i;
                    f.seek(pos);

                    long rid = f.readLong();
                    String[] r = new String[attr.size() + 1]; // rid+atributele;
                    r[0] = "rid = " + rid;

                    int last_index = 0, j = 1;
                    Iterator it = attr.iterator();

                    boolean found=false;

                    while (it.hasNext()) {
                            Attribute a = (Attribute) it.next();
                            String type = a.getType();


                            if (a.getName().equals(key)) {

                                int size = a.getLength();

                                if (type.contains("byte"))
                                        r[j] = f.readByte() + "";
                                else if (type.contains("int"))
                                        r[j] = f.readInt() + "";
                                else if (type.contains("double"))
                                        r[j] = f.readDouble() + "";
                                else if (type.contains("float"))
                                        r[j] = f.readFloat() + "";
                                else if (type.contains("long"))
                                        r[j] = f.readLong() + "";
                                else if (type.contains("short"))
                                        r[j] = f.readShort() + "";
                                else if (type.contains("char")
                                                || type.contains("varchar") || type.contains("date")) {
                                        String st = "";
                                        char c;
                                        for (int k = 0; k < size; k++) {
                                                c = (char) f.read();
                                                st += c;
                                        }
                                        r[j] = st;
                                }

                                //problema cu spatiile de la sfarsit
                                System.out.println("--"+r[j]+"--");
                                if (noEndBlanks(r[j]).equals(value)) found = true;
                                j++;
                            }
                    }
                    if (found)
                                records.add(r);
                }
            }
        } catch (Exception e) {
                //e.printStackTrace();
        }
        return records;
    }

    public void deleteRecord(int[] rids) {
        // rids - citit de pe interfata; porneste de la 1;
        setRecordStatus(rids, "delete");
    }

    public String noEndBlanks(String s){
       int len = s.length()-1;
       while (s.charAt(len)==' '){
           len--;
       }

       return s.substring(0, len+1);
    }
	
}