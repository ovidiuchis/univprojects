/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cabd_pr1;

import java.awt.Color;
import java.util.Vector;
import javax.swing.JFrame;
import org.math.plot.Plot3DPanel;

/**
 *
 * @author Pavel George
 */

public class Draw {
    //Plot3DPanel plot =new Plot3DPanel();
    //plot.addl

    Draw(Vector<Punct> puncte, Vector<Segment> segmente) {
      //  System.out.println("draw");
        Plot3DPanel plot =new Plot3DPanel();
        double[] X = new double[2];
        double[] Y = new double[2];
        double[] Z = new double[2];
        //System.out.println(puncte.get(0).getX());
        for (int i=0;i<puncte.size();i++){
            //System.out.println(puncte.get(i).getX());
            int j=0;
            double[] c1=puncte.get(i).getCoord();
            X[j]=c1[0];
            Y[j]=c1[1];
            Z[j]=c1[2];
            j++;
            //double[] c2=segmente.get(i).getCoord2();
            X[j]=c1[0];
            Y[j]=c1[1];
            Z[j]=c1[2];
            j++;
            plot.addScatterPlot("my plot",Color.RED, X, Y, Z);
            
   
        }
        //int j=0;
        for (int i=0;i<segmente.size();i++){
            //System.out.println(puncte.get(i).getX());
            int j=0;
            double[] c1=segmente.get(i).getCoord1();
            X[j]=c1[0];
            Y[j]=c1[1];
            Z[j]=c1[2];
            j++;
            double[] c2=segmente.get(i).getCoord2();
            X[j]=c2[0];
            Y[j]=c2[1];
            Z[j]=c2[2];
            j++;
            plot.addLinePlot("my plot",Color.GREEN, X, Y, Z);
        }
        
        //plot.addLinePlot("my plot",Color.GREEN, X, Y, Z);
        JFrame frame = new JFrame("my plot");
        frame.setContentPane(plot);
        frame.setVisible(true);
    }
}
