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
public class Segment {
    double coord1[];
    double coord2[];
    Timestamp timestamp;
    int id;

    Segment(double[] f1, double[] f2) {
        coord1=f1;
        coord2=f2;
        java.util.Date date= new java.util.Date();
        timestamp=new Timestamp(date.getTime());
    }

    Segment(int i, double[] f1, double[] f2) {
        this.id=i;
        coord1=f1;
        coord2=f2;
        java.util.Date date= new java.util.Date();
        timestamp=new Timestamp(date.getTime());
    }
    public double[] getCoord1(){
        return this.coord1;
    }

    public double[] getCoord2(){
        return this.coord2;
    }

    Timestamp getTimestamp() {
        return this.timestamp;
    }

}
