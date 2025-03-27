import java.io.*;

public class Main {
	public static void main(String argv[]) throws IOException {
		DoubleLinkedList L = new DoubleLinkedList();
		BufferedReader r = new BufferedReader(new InputStreamReader(System.in));
		for (int i = 0; i <= 2; i++) {
			String s1 = r.readLine();
			String s2 = r.readLine();
			Persoana p = new Persoana(s1, s2);
			L.add(p);
		}
		DLListIterator itr = L.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
		itr.reset();
		L.removeAtIndex(2);
		while (itr.hasNext()) {
			System.out.println(itr.next());
		}
	
	}
}