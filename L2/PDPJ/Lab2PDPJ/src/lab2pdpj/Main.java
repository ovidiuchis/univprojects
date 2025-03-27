package lab2pdpj;

import java.util.*;
//import org.apache.log4j.*;

/**
 *
 * @author ciuby
 */
public class Main extends Thread {

    private static int[] a;
    private static int[] b;
    private static int[] c;
    private int id;
    private int k;
    //static Logger logger = Logger.getLogger(Main.class);

    public Main(){id=0;}
    public Main(int cod){id=cod;}

    //bubble sort

    private void bubbleSort(int[] sir, int n) {
        
        long start = System.currentTimeMillis();
//        Package p= Layout.class.getPackage();
        int aux, i, j;
        //System.out.println("in bubble");
        for (i = 0; i < n - 1; i++) {
            for (j = 0; j < n - 1 - i; j++) {
                if (sir[j] > sir[j + 1]) {
                    aux = sir[j];
                    sir[j] = sir[j + 1];
                    sir[j + 1] = aux;
                }
            }
        }
        System.out.println("in bubble");
        long end = System.currentTimeMillis();
        
        //logger.info("Bubble Sort execution time was "+(end-start)+" ms");
        System.out.println("Bubble Sort execution time was "+(end-start)+" ms");
    }

//quick sort

    private int partition(int sir[], int left, int right){
        int i = left, j = right;
        int aux;
        int pivot = sir[(left + right) / 2];
        while (i <= j) {
            while (sir[i] < pivot)
                i++;
            while (sir[j] > pivot)
                j--;
            if (i <= j) {
                aux = sir[i];
                sir[i] = sir[j];
                sir[j] = aux;
                i++;
                j--;
            }
        }
        return i;
    }


    private void quickSort(int sir[], int left, int right) {
        long start = System.currentTimeMillis();
        int index = partition(sir, left, right);
        if (left < index - 1)
            quickSort(sir, left, index - 1);
        if (index < right)
            quickSort(sir, index, right);
        long end = System.currentTimeMillis();
        //logger.info("Quick Sort execution time was "+(end-start)+" ms");
        System.out.println("Quick Sort execution time was "+(end-start)+" ms");
    }

//sortare prin interclasare

    public void mergeSort(int sir[], int lo, int n) {
        long start = System.currentTimeMillis();
        int low = lo;
        int high = n;
        if (low >= high) {
            return;
        }

        int middle = (low + high) / 2;
        mergeSort(sir, low, middle);
        mergeSort(sir, middle + 1, high);
        int end_low = middle;
        int start_high = middle + 1;
        while ((lo <= end_low) && (start_high <= high)) {
            if (sir[low] < sir[start_high]) {
                low++;
            } else {
                int Temp = sir[start_high];
                for (int x = start_high - 1; x >= low; x--) {
                    sir[x + 1] = sir[x];
                }
                sir[low] = Temp;
                low++;
                end_low++;
                start_high++;
            }
        }
        long end = System.currentTimeMillis();
        //logger.info("Merge Sort execution time was "+(end-start)+" ms");
        System.out.println("Merge Sort execution time was "+(end-start)+" ms");

    }

    public void run(){
        System.out.println("run "+id);
        if(id==0){
            bubbleSort(a, 10);
        }
        else if(id==1){
            quickSort(b, 0, 9);
        }
        else if(id==2){
            mergeSort(c, 0, 9);
        }
    }

    public static void main(String[] args) {
//      SimpleLayout layout = new SimpleLayout();
//      FileAppender appender = null;
//      try {
//         appender = new FileAppender(layout,"output.txt",false);
//      } catch(Exception e) {}
//
//      logger.addAppender(appender);
//        logger.setLevel(Level.INFO);
        Random generator = new Random();
        a=new int[10];
        b=new int[10];
        c=new int[10];

        for(int i=0;i<10;i++){
            a[i]=generator.nextInt(10);
        }
        b=a;
        c=a;
//        for(int i=0;i<1000;i++){
//            System.out.println(a[i]);
//        }

        Main threads[] = new Main[3];
        for(int i=0; i<3; i++) {
            threads[i] = new Main(i);
        }
        for(int j=0; j<3; j++){
            threads[j].start();
        }
    }

}
