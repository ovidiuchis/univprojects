/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Objects;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.joda.time.DateTime;
import org.joda.time.Duration;
import org.joda.time.Seconds;

/**
 *
 * @author Ovidiu
 */
public class Point {
   double x;
   double y;
   double z;
   Timestamp timestamp;
   int id;
   
   public Point (int id, double x, double y, double z){
       this.x=x;
       this.y=y;
       this.z=z;
       this.id=id;
       
       java.util.Date date= new java.util.Date();
       timestamp=new Timestamp(date.getTime());
   }
   public double X(){
       return x;
   }
   public double Y(){
       return y;
   }
   public double Z(){
       return z;
   }
   public String ID(){
       return String.valueOf(id);
   }
   public Timestamp Timestamp(){
       return this.timestamp;
   }
   
   public boolean DateDiff(Date d){
            
       return timestamp.before(d);
       
       
   }
   public double[] ToDoubleArray(){
       double[] coordonate = new double[3];
       
       coordonate[0]=this.x;
       coordonate[1]=this.y;
       coordonate[2]=this.z;
       
       return coordonate;
   } 
    /**
     *
     * @return
     */
    
    public String ToStringCuTimestamp(){
        StringBuilder sb = new StringBuilder();
        sb.append("ID: ");
        sb.append(this.id);
        sb.append(" | X=");
        sb.append(x);
        sb.append(", Y=");
        sb.append(y);
        sb.append(",Z=");
        sb.append(z);
        sb.append("; cu timestampul ");
        sb.append(this.timestamp);
        
        return sb.toString();
       
       
   }
    
  public String ToStringS(){
        StringBuilder sb = new StringBuilder();
        sb.append("X=");
        sb.append(x);
        sb.append(", Y=");
        sb.append(y);
        sb.append(",Z=");
        sb.append(z);
       
        return sb.toString();
       
       
   }
  
  
}
