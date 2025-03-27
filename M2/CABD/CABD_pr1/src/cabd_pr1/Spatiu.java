/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cabd_pr1;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pavel George
 */
public class Spatiu {
    public Vector<Punct> puncte=new Vector<Punct>();
    public Vector<Segment> segmente=new Vector<Segment>();
     public Vector<Punct> puncte2=new Vector<Punct>();

    public void init(){
        double[] f={3,14,4};
        long d=new Date().getTime();
        Punct p1=new Punct(1,f);
        puncte.add(p1);
        System.out.println("S-a creat punctul:"+p1.getX()+", "+p1.getY()+", "+p1.getZ()+", timestamp: "+p1.getTimestamp());
        
        double[] f3={3,14,4};
        double[] f4={6,13,4};
        Segment s1=new Segment(1,f3,f4);

        double[] f1={6,13,4};
        double[] f2={9,3,4};

        Segment s2=new Segment(2,f1,f2);
        segmente.add(s1);
        System.out.println("S-a creat segmentul: "+s1.getCoord1().toString()+"; "+s1.getCoord2().toString()+"; timestamp: "+s1.getTimestamp());
        segmente.add(s2);
        System.out.println("S-a creat segmentul: "+s2.getCoord1().toString()+"; "+s2.getCoord2().toString()+"; timestamp: "+s2.getTimestamp());
    }
    public void draw(){
        Draw dr=new Draw(puncte,segmente);
    }
    public void avanseaza(){
       
            //puncte2 = puncte;
            int a=0;
            int w=0;
            Punct pp = null;
          //  System.out.println(puncte.size());
            for (int i = 0; i < puncte.size(); i++) {
                if (!puncte2.contains(puncte.get(i))){
                    puncte2.add(puncte.get(i));
                }
                Punct p=new Punct();
                if (a<=segmente.size()){
                 p.setID(puncte.get(i).getId());
                //puncte2.add(p);
                p.setX(puncte.get(i).getX()+1);
                //p.setY(13);
                p.setZ(4);
                //double y=(45-p.getX())/3;
                double y=((p.getX()-segmente.get(a).getCoord1()[0])*(segmente.get(a).getCoord2()[1]-segmente.get(a).getCoord1()[1]))/(segmente.get(a).getCoord2()[0]-segmente.get(a).getCoord1()[0])+segmente.get(a).getCoord1()[1];
                p.setY(y);
                puncte.set(i, p);
                }
                
                for (int k = 1; k < segmente.size(); k++) {
                    if (!apartine(segmente.get(k),p)) {
                        if (k<segmente.size()-1){
                            p.setX(segmente.get(k).getCoord1()[0]);
                            p.setY(segmente.get(k).getCoord1()[1]);
                            p.setZ(segmente.get(k).getCoord1()[2]);
                        }
                        a++;
                    }
                }
                java.util.Date date = new java.util.Date();
                Timestamp timestamp = new Timestamp(date.getTime());
                p.setTimestamp(timestamp);
                System.out.println("Noile coordonate pt punctul:"+i+": "+p.getX()+", "+p.getY()+", "+p.getZ()+", timestamp: "+p.getTimestamp());
                pp=p;
                puncte2.add(pp);
                //w++;
                //System.out.println(puncte2.get(puncte2.size()-1).getCoord()[0]);
            }
            //puncte = puncte2;

          
            
             try {
            Thread.sleep(100);
            draw();
        } catch (InterruptedException ex) {
            Logger.getLogger(Spatiu.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private boolean apartine(Segment get, Punct p) {
        if (p.getX()>get.getCoord2()[0]){
            return false;
        }
        return true;
    }

    double[] returneazaToateCoord(int i) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    boolean apartineDreptei(double[] t, int i) {
        double r1=(t[0]-segmente.get(i).getCoord1()[0])/(segmente.get(i).getCoord2()[0]-segmente.get(i).getCoord1()[0]);
        double r2=(t[1]-segmente.get(i).getCoord1()[1])/(segmente.get(i).getCoord2()[1]-segmente.get(i).getCoord1()[1]);
        double r3=(t[2]-segmente.get(i).getCoord1()[2])/(segmente.get(i).getCoord2()[2]-segmente.get(i).getCoord1()[2]);
        if(r1==r2 || r2==r3){
            return true;
        }
        return false;
    }

        double[] returneazaToateCoordX(int id) {
        int y=0;
        double[] v=new double[puncte2.size()];
        for (int i=0;i<puncte2.size();i++){
            if (puncte2.get(i).getId()==id){
                v[y]=puncte2.get(i).getY();
                y++;
            }
        }
        return v;

    }

    double[] returneazaToateCoordY(int id) {
        int y=0;
        double[] v=new double[puncte2.size()];
        for (int i=0;i<puncte2.size();i++){
            if (puncte2.get(i).getId()==id){
                v[y]=puncte2.get(i).getY();
                y++;
            }
        }
        return v;
    }

    double[] returneazaToateCoordZ(int id) {
        int y=0;
        double[] v=new double[puncte2.size()];
        for (int i=0;i<puncte2.size();i++){
            if (puncte2.get(i).getId()==id){
                v[y]=puncte2.get(i).getZ();
                y++;
            }
        }
        return v;
    }

    Vector<Timestamp> getTimestamps(int i) {
        Vector<Timestamp> t=new Vector<Timestamp>();
        for (int y=0;y<puncte2.size();y++)
            if (puncte2.get(y).getId()==i){
                t.add(puncte2.get(y).getTimestamp());

            }
        return t;
    }


}
