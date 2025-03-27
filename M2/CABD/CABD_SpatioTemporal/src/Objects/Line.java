/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Objects;

import java.sql.Timestamp;

/**
 *
 * @author Ovidiu
 */
public class Line {
    
    private Point p1;
    private Point p2;
    private Timestamp timestamp;
    
    public Line (Point u, Point d){
        this.p1=u;
        this.p2=d;
        java.util.Date date= new java.util.Date();
        timestamp=new Timestamp(date.getTime());
    }
    
    
    public String ToStringL(){
    
          StringBuilder sb = new StringBuilder();
          sb.append("Din punctul de coord: ");
          sb.append(p1.ToStringS());
          sb.append(" in punctul de coord: ");
          sb.append(p2.ToStringS());
          sb.append("; cu timestampul ");
          sb.append(this.timestamp);
          
          return sb.toString();
    
    }
    
   public Point P1(){
       return p1;
   }
   public Point P2(){
       return p2;
   }
   
   public boolean continePunct(Point p){
      double a1,a2,a3;
       a1=(p.X()-p1.X())/(p2.X()-p1.X());
       a2=(p.Y()-p1.Y())/(p2.Y()-p1.Y());
       a3=(p.Z()-p1.Z())/(p2.Z()-p2.Z());
  
       if (a1==a2 || a2==a3)
         return true;
       return false;
   }
  public double lungime(){
      
      return Math.sqrt(Math.pow(p2.X()-p1.X(),2)+Math.pow(p2.Y()-p1.Y(),2)+Math.pow(p2.Z()-p1.Z(),2));
      
  }
  
  public int comparLungime(Line n){
      
      if (this.lungime()>n.lungime())
          return 1;
      if (this.lungime()<n.lungime())
          return -1;
      return 0;
             
  }
 }
