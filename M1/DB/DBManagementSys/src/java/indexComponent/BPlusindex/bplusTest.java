package indexComponent.BPlusindex;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.*;

import rmComponent.DBManagement.*;

/// <summary>
/// tests main entry point for BplusJ.  Throws exception on failure.
/// </summary>
public class bplusTest {
	public static String tempdirectory="E:/fisiere";// = "e:/Facultate/An I., Sem II/Implementarea SGBD/Proiect/ISGBD/files/"; // set to storing to/from files
	public static String indexFileName;//="Specialization.index";//= "e:/Facultate/An I., Sem II/Implementarea SGBD/Proiect/ISGBD/files/Spec.index";
        public static String indexOnAttr;
	public static String fileName="Specialization.bin";// = "e:/Facultate/An I., Sem II/Implementarea SGBD/Proiect/ISGBD/files/Spec.bin";
	public static String rsFileName="Specialization.rs";// = "e:/Facultate/An I., Sem II/Implementarea SGBD/Proiect/ISGBD/files/Spec.rs";
	public static String db = "University";
        public static String table = "Specialization";

	static Hashtable allinserts = new Hashtable();
	static Hashtable lastcommittedinserts = new Hashtable();
	static boolean full = true;
	static int keylength = 20;
	static int prefixlength = 6;
	static int nodesize = 8;
	static int buffersize = 100;
	static int bucketsizelimit = 100; // sanity check
        public static boolean makeIndexFiles=true;

        public bplusTest(String database, String table){
            tempdirectory = "E:/fisiere/";
            fileName = table+".bin";
            rsFileName = table+".rs";
            db = database;
            makeIndexFiles=true;

        }

        public bplusTest(){

        }
        
	public static void main(String argv[]) throws Exception {

//                CatalogManager catalogReader = new CatalogManager();
//                ArrayList<Attribute> attributeList = catalogReader.getFields(db, table);
//
//                Iterator it = attributeList.iterator();
//                while (it.hasNext()) {
//                    Attribute a = (Attribute) it.next();
//                    indexOnAttr = a.getName();
//                    indexFileName = table+"_"+indexOnAttr+".index";
//                    createIndexFile(indexOnAttr);
//                }

                createIndexFile("Groups.index");
			
		ArrayList<String> result = query("Groupid","1","");

                Iterator it = result.iterator();
                while(it.hasNext()){
                    System.out.println(it.next().toString());
                }

		//insertNodeIntoIndexFile(indexFileName, indexOnAttr, "pafsdfsdfsfsfsndipiky", 6217);
			
		//deleteNodeFromIndexFile(indexOnAttr, "ooo                           ");
			
		//testBufferFile();
		//BplusTreeLongTest();
	}

	
	public static ArrayList<String> query(String attrName, String v1, String v2) throws Exception{
                ArrayList<String> result=null;

		byte[] recordStatus = new byte[0];
		recordStatus = getRecordStatus();
		java.io.RandomAccessFile mstream = makeFile(indexFileName);
		int keylength = 30 + nodesize;   //aici modific;
		
		try {
			BplusTreeLong bpt = BplusTreeLong.InitializeInStream(mstream,
					keylength, nodesize);
			bpt = restart(bpt);
			
 			for (int i = 0; i < recordStatus.length; i++) // all records;
                            try{
				if (recordStatus[i] == 0) {
					String[] s = readDataFile(i, attrName);
					inserttest(bpt, s[1], Long.parseLong(s[0]));  //s[1]==key; s[0]==rid;
					commit(bpt);
				}
                            }catch(NumberFormatException e){continue;}
			
			System.out.println("The B+ Tree:");
			//System.out.println(bpt.toHtml(v1, v2));
                        result = bpt.toHtml(v1, v2);
		} catch (IOException e) {
		}

                return result;
	}
	
	public static void createIndexFile(String attrName) throws Exception{
		byte[] recordStatus = new byte[0];
		recordStatus = getRecordStatus();

		java.io.RandomAccessFile mstream = makeFile(indexFileName);
		int keylength = 30 + nodesize;   //aici modific;
		
		BplusTreeLong bpt = BplusTreeLong.InitializeInStream(mstream,
				keylength, nodesize);
		
		bpt = restart(bpt);

		System.out.println("CREATING INDEX FILE:");
		try {
			for (int i = 0; i < recordStatus.length-1; i++) // all records;

				if (recordStatus[i] == 0) {
                                    String[] s = readDataFile(i, attrName);

                                    System.out.println("s[0]="+s[0]+"; s[1]="+s[1]);

                                    try{

                                    inserttest(bpt, s[1], Long.parseLong(s[0]));  //s[1]==key; s[0]==rid;

                                    }catch(NumberFormatException e){
                                        break;
                                    }

                                    commit(bpt);


				}
			
			//new insert;
			//for(int i=0;i<100;i++)
			//inserttest(bpt, "test"+i, 1024+i);
						
			mstream.close();
			mstream = null;
		} catch (IOException e) {
		} 
		//System.out.println("The B+ Tree:");
		//System.out.println(bpt.toHtml("",""));
	}
	
	public static void insertNodeIntoIndexFile(String indexFileName, String attrName, String k, long rid) throws Exception{
		byte[] recordStatus = new byte[0];
		recordStatus = getRecordStatus();
		java.io.RandomAccessFile mstream = makeFile(indexFileName);
		int keylength = 30 + nodesize;   //aici modific;
		
		try {
			BplusTreeLong bpt = BplusTreeLong.InitializeInStream(mstream,
					keylength, nodesize);
			bpt = restart(bpt);
			
 			for (int i = 0; i < recordStatus.length; i++) // all records;
                            try{
				if (recordStatus[i] == 0) {
					String[] s = readDataFile(i, attrName);
					
					inserttest(bpt, s[1], Long.parseLong(s[0]));  //s[1]==key; s[0]==rid;
					commit(bpt);
				}
                            }catch(NumberFormatException e){continue;}
				
			System.out.println("INSERT IN INDEX FILE:");
			inserttest(bpt, k, rid);
			commit(bpt);
						
			mstream.close();
			mstream = null;
			
			System.out.println("The B+ Tree:");
			System.out.println(bpt.toHtml("",""));
		} catch (IOException e) {
		}
	}
	
	public static void deleteNodeFromIndexFile(String attrName, String key) throws Exception{
		for (int nodesize = 2; nodesize < 6; nodesize++) {
			java.io.RandomAccessFile mstream = makeFile(indexFileName);
			int keylength = 30 + nodesize;  //aici modific;
			BplusTreeLong bpt = BplusTreeLong.InitializeInStream(mstream,
					keylength, nodesize);
			//bpt = restart(bpt);
			
			commit(bpt);
			mstream.close();
			mstream = null;
		}
		
		byte[] recordStatus = new byte[0];
		recordStatus = getRecordStatus();
		java.io.RandomAccessFile mstream = makeFile(indexFileName);
		int keylength = 30 + nodesize;   //aici modific;
		
		try {
			BplusTreeLong bpt = BplusTreeLong.InitializeInStream(mstream,
					keylength, nodesize);
			bpt = restart(bpt);
			
			for (int i = 0; i < recordStatus.length; i++) // all records;
                            try{
				if (recordStatus[i] == 0) {
					String[] s = readDataFile(i, attrName);
					inserttest(bpt, s[1], Long.parseLong(s[0]));  //s[1]==key; s[0]==rid;
					commit(bpt);
				}
                            }catch(NumberFormatException e){continue;}

			System.out.println("DELETING VALUE (<"+key+", RID>)");
			deletetest(bpt, key, 0);
			commit(bpt);
						
			mstream.close();
			mstream = null;
			
			System.out.println("The B+ Tree:");
			System.out.println(bpt.toHtml("",""));
		} catch (IOException e) {
		}
	}
	
	
	public static int getRecordLength(ArrayList<Attribute> attr) {
		int record_length = 0;
		Iterator it = attr.iterator();
		while (it.hasNext()) {
			Attribute a = (Attribute) it.next();
			record_length += a.getLength();
		}
		return record_length;
	}
	
	public static byte[] getRecordStatus() {
		byte[] recordStatus = new byte[0];
		try {
			RandomAccessFile f = new RandomAccessFile("E:/fisiere/"+rsFileName, "r");
			recordStatus= f.readLine().getBytes();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
		}
		return recordStatus;
	}
	
	public static String[] readDataFile(int ind, String attrName) throws Exception {
		String[] record = new String[2];
		long pos = 0;
		
		DBManager cr = new DBManager();
		ArrayList<Attribute> attr = cr.getFields(db, table);



		int record_length = getRecordLength(attr);

		try {
			RandomAccessFile f = new RandomAccessFile("E:/fisiere/"+fileName, "r");

			pos = (9 + record_length) * ind;
			f.seek(pos);

			long rid = f.readLong();

			record[0] = rid+"";

			int j = 0, key=0;
			String[] r = new String[attr.size()];
			Iterator it = attr.iterator();
			
			while (it.hasNext()) {
				Attribute a = (Attribute) it.next();
				String type = a.getType();
				String name = a.getName();
				int size = a.getLength();
						
				if(name.equals(attrName))
					key = attr.indexOf(a);

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
				else if (type.contains("char") || type.contains("varchar")) {
					String st = "";
					char c;
					for (int k = 0; k < size; k++) {
						c = (char) f.read();
						st += c;
					}
					r[j] = st;
				}
				j++;
			} //while;

			record[1] = r[key];
		} catch (Exception e) {
                    //e.printStackTrace();
		}
		return record;
	}
	
	
	
	
	public static java.io.RandomAccessFile makeFile(String name)
			throws Exception {
		if (tempdirectory == null) {
			System.out
					.println("to run these tests you need to edit the source file, adding a String definition for tempdirectory");
			throw new Exception(
					"to run these tests you need to edit the source file, adding a String definition for tempdirectory");
		}
		String path = tempdirectory + "/" + name;
		// delete it if it exists
		java.io.File f = new java.io.File(path);
		if (f.exists()) {
			System.out.println("<br>				DELETING FILE " + path);
			f.delete();
		}
		return new java.io.RandomAccessFile(path, "rw");
	}

	public static void abort(BplusTreeLong bpt) throws Exception {
		System.out.println(" <h3>ABORT!</H3>");
		bpt.Abort();
		allinserts = (Hashtable) lastcommittedinserts.clone();
		checkit(bpt);
	}

	public static void commit(BplusTreeLong bpt) throws Exception {
		System.out.println(" <h3>COMMIT!</H3>");
		bpt.Commit();
		lastcommittedinserts = (Hashtable) allinserts.clone();
		checkit(bpt);
	}

	public static BplusTreeLong restart(BplusTreeLong bpt) throws Exception {
		System.out.println(" <h3>RESTART!</H3>");
		commit(bpt);
		return BplusTreeLong.SetupFromExistingStream(bpt.fromfile,
				bpt.seekStart);
	}

	public static void inserttest(BplusTreeLong bpt, String key, long map)
			throws Exception {
		inserttest(bpt, key, map, false);
	}

	public static void deletetest(BplusTreeLong bpt, String key, long map)
			throws Exception {
		inserttest(bpt, key, map, true);
	}

	public static void inserttest(BplusTreeLong bpt, String key, long map,
			boolean del) throws Exception {
		if (del) {
			System.out.println(" <h3>DELETE bpt[" + key + "] = " + map
					+ "</h3>");
			bpt.RemoveKey(key);
			allinserts.remove(key);
		} else {
			System.out.println("<h3>bpt[" + key + "] = " + map + "</h3>");
			// bpt[key] = map;
			bpt.set(key, map);
			// allinserts[key] = map;
			allinserts.put(key, new Long(map));
		}
		checkit(bpt);
	}

	public static void checkit(BplusTreeLong bpt) throws Exception {
		// System.out.println(bpt.toHtml());
		bpt.SanityCheck(true);
		TreeSet allkeys = new TreeSet();
		// foreach (DictionaryEntry d in allinserts)
		for (Enumeration e = allinserts.keys(); e.hasMoreElements();) {
			allkeys.add(e.nextElement());
		}
		// allkeys.Sort();
		// allkeys.Reverse();
		// foreach (object thing in allkeys)
		for (Iterator e = allkeys.iterator(); e.hasNext();) {
			Object thing = e.next();
			String thekey = (String) thing;
			long thevalue = ((Long) allinserts.get(thing)).longValue();

                        if(makeIndexFiles)
                            thevalue = bpt.get(thekey);

			if (thevalue != bpt.get(thekey)) {
				throw new Exception("no match on retrieval " + thekey + " --> "
						+ bpt.get(thekey) + " not " + thevalue);
			}
		}
		// allkeys.Reverse();
		String currentkey = bpt.FirstKey();
		for (Iterator e = allkeys.iterator(); e.hasNext();) {
			Object thing = e.next();
			String testkey = (String) thing;

                      if(!makeIndexFiles) {
    			if (currentkey == null) {
				throw new Exception("end of keys found when expecting "
						+ testkey);
			}
			if (!testkey.equals(currentkey)) {
				throw new Exception("when walking found " + currentkey
						+ " when expecting " + testkey);
			}
                     currentkey = bpt.NextKey(testkey);
                      }
		}
	}

	public static void BplusTreeLongTest() throws Exception {
		System.out.println("TESTING BPLUSTREELONG"); 
		
		for (int nodesize = 2; nodesize < 6; nodesize++) {
			allinserts = new Hashtable();
			java.io.RandomAccessFile mstream = makeFile(indexFileName);
			int keylength = 10 + nodesize;
			BplusTreeLong bpt = BplusTreeLong.InitializeInStream(mstream,
					keylength, nodesize);
			bpt = restart(bpt);
			inserttest(bpt, "d", 15);
			deletetest(bpt, "d", 15);
			inserttest(bpt, "d", 15);
			bpt.SerializationCheck();
			inserttest(bpt, "ab", 55);
			inserttest(bpt, "b", 50);
			deletetest(bpt, "b", 0);
			inserttest(bpt, "b", 50);
			inserttest(bpt, "c", 34);
			inserttest(bpt, "a", 8);
			commit(bpt);
			System.out.println("<h1>after commit</h1>\r\n");
			inserttest(bpt, "a", 800);
			inserttest(bpt, "ca", 999);
			inserttest(bpt, "da", 999);
			inserttest(bpt, "ea", 9991);
			inserttest(bpt, "aa", 9992);
			inserttest(bpt, "ba", 9995);
			commit(bpt);
			inserttest(bpt, "za", 9997);
			inserttest(bpt, " a", 9999);
			commit(bpt);
			deletetest(bpt, "d", 0);
			deletetest(bpt, "da", 0);
			deletetest(bpt, "ca", 0);
			bpt = restart(bpt);
			inserttest(bpt, "aaa", 88);
			System.out.println(" now doing torture test for " + nodesize);
			System.out.println("<h1>now doing torture test for " + nodesize
					+ "</h1>");
			if (full) {
				for (int i = 0; i < 33; i++) {
					for (int k = 0; k < 10; k++) {
						int m = (i * 5 + k * 23) % 77;
						String s = "b" + m;
						inserttest(bpt, s, m);
						if (i % 2 == 1 || k % 3 == 1) {
							deletetest(bpt, s, m);
						}
					}
					int j = i % 3;
					if (j == 0) {
						abort(bpt);
					} else if (j == 1) {
						commit(bpt);
					} else {
						bpt = restart(bpt);
					}
				}
			}
			commit(bpt);
			deletetest(bpt, "za", 0);
			deletetest(bpt, "ea", 0);
			deletetest(bpt, "c", 0);
			deletetest(bpt, "ba", 0);
			deletetest(bpt, "b", 0);
			deletetest(bpt, "ab", 0);
			abort(bpt);
			inserttest(bpt, "dog", 1);
			commit(bpt);
			deletetest(bpt, "dog", 1);
			inserttest(bpt, "pig", 2);
			abort(bpt);
			inserttest(bpt, "cat", 3);
			inserttest(bpt, "catxxx xz", 10);
			bpt.Recover(true);
			mstream.close();
			mstream = null;
			
			bpt.toHtml("","");
		}
	}

	public static byte[] makeSampleData(String testdata, int sizing)
			throws Exception {
		if (testdata.length() < 1 || sizing < 1) {
			return new byte[0];
		}
		// System.Text.StringBuilder sb = new System.Text.StringBuilder();
		java.io.ByteArrayOutputStream sb = new java.io.ByteArrayOutputStream();
		byte[] bytedata = testdata.getBytes();
		for (int i = 0; i < sizing; i++) {
			// char c = testdata[i % testdata.length];
			// sb.Append(testdata);
			// sb.Append(c);
			sb.write(bytedata);
			int index = i % bytedata.length;
			sb.write(bytedata, index, 1);
		}
		// String result = sb.ToString();
		// return System.Text.UTF8Encoding.ASCII.GetBytes(result);
		return sb.toByteArray();
	}

	public static void testBufferFile() throws Exception {
		System.out.println("TESTING BUFFERFILE");
		int buffersize = 17;
		int writesize = 10;
		// System.IO.Stream mstream = new System.IO.MemoryStream();
		java.io.RandomAccessFile mstream = makeFile("jbf.dat");
		int offset = 55;
		BufferFile bf = BufferFile.InitializeBufferFileInStream(mstream,
				buffersize, offset);
		byte[] testheader = bf.makeHeader();
		byte[] inputarray = makeSampleData(
				"THIS IS SOME sample data off the cuff...", 100);
		byte[] outputarray = new byte[inputarray.length];
		int position = 0;
		// shove in the testdata in reverse order
		for (int i = inputarray.length; i > writesize; i -= writesize) {
			System.out.println(" " + position);
			// Console.Write(" "+position);
			bf.setBuffer(position, inputarray, i - writesize, writesize);
			position++;
		}
		bf.setBuffer(position, inputarray, 0, writesize);
		// extract it again
		bf = BufferFile.SetupFromExistingStream(mstream, offset);
		position = 0;
		System.out.println("");
		for (int i = inputarray.length; i > writesize; i -= writesize) {
			System.out.println(" " + position);
			// Console.Write(" "+position);
			bf.getBuffer(position, outputarray, i - writesize, writesize);
			position++;
		}
		bf.getBuffer(position, outputarray, 0, writesize);
		testByteArrays(inputarray, outputarray);
		System.out.println("");
		System.out.println(" buffer file test ok");
	}

	public static void testByteArrays(byte[] a, byte[] b) throws Exception {
		if (a.length != b.length) {
			throw new Exception("array lengths don't match " + a.length + " "
					+ b.length);
		}
		for (int i = 0; i < b.length; i++) {
			if (a[i] != b[i]) {
				throw new Exception("first error at " + i + " " + a[i] + " "
						+ b[i]);
			}
		}
	}
	
	
	

	public int newIndexFile() {
		File f = new File(indexFileName);
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

	public int dropIndexFile() {
		File f = new File(indexFileName);
		if (f.exists())
			f.delete();
		else
			return 0;
		return 1;
	}	
}