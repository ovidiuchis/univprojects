/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cabd_pr1;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Pavel George
 */
public class Punct {
    int id;
    double coord[];
    Timestamp timestamp;

    Punct(double[] f) {
        coord=f;
        java.util.Date date= new java.util.Date();
        timestamp=new Timestamp(date.getTime());
    }

    Punct(float[] f, long d) {

    }

    Punct(int i, double[] f) {
        this.id=i;
        coord=f;
        java.util.Date date= new java.util.Date();
        timestamp=new Timestamp(date.getTime());
    }

    Punct() {
        double[] f={0,0,0};
        coord=f;
    }
    public double[] getCoord(){
        return this.coord;
    }
    public double getX(){
        return coord[0];
    }
    public double getY(){
        return coord[1];
    }
    public double getZ(){
        return coord[2];
    }

    void setX(double i) {
       // System.out.println(i);
        this.coord[0]=i;
    }

    void setY(double i) {
        this.coord[1]=i;
    }

    void setZ(double i) {
        this.coord[2]=i;
    }

    void setTimestamp(Timestamp timestamp) {
        this.timestamp=timestamp;
    }

    Timestamp getTimestamp() {
        return this.timestamp;
    }

    int getId() {
       return this.id;
    }

    void setID(int id) {
        this.id=id;
    }


}
