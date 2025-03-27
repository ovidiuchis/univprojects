/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cabd_pr1;

import java.sql.Timestamp;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pavel George
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Spatiu s=new Spatiu();
        s.init();
        s.draw();
        int i=0;
       while (i<5){
            try {
                Thread.sleep(100);
                s.avanseaza();
                i++;
            } catch (InterruptedException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        double[] c=s.returneazaToateCoordX(1);
        System.out.println("coordonatele X ale punctului 1:");
        for (int i2=0;i2<c.length;i2++){
            System.out.println(c[i2]+", ");
        }
        double[] c1=s.returneazaToateCoordY(1);
        System.out.println("coordonatele Y ale punctului 1:");
        for (int i2=0;i2<c1.length;i2++){
            System.out.println(c1[i2]+", ");
        }
        double[] c2=s.returneazaToateCoordZ(1);
        System.out.println("coordonatele Y ale punctului 1:");
        for (int i2=0;i2<c2.length;i2++){
            System.out.println(c2[i2]+", ");
        }
        double[] t={2,4,6};
        if (s.apartineDreptei(t,1))
            System.out.println("Punctul "+t[0]+","+t[1]+","+t[2]+"  apartine dreptei cu id 1");
        else
            System.out.println("Punctul "+t[0]+","+t[1]+","+t[2]+" nu apartine dreptei cu id 1");

        Vector<Timestamp> t2=s.getTimestamps(1);
        System.out.println("timestampul cand s-a modificat pozitia punctului 1:");
        for (int e=0;e<t2.size();e++){
            
            System.out.println(t2.get(e).toString());
        }
    }



}
