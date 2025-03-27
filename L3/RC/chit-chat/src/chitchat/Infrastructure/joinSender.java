/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package chitchat.Infrastructure;


import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.util.Random;


/**
 *
 * @author Administrator
 */
public class joinSender extends Thread{
    DatagramSocket theSocket;
    DatagramPacket thePacket;

    public joinSender(DatagramSocket socket, DatagramPacket packet) {
        this.theSocket = socket;
        this.thePacket = packet;
    }

    @Override
    public void run(){
        Random sec = new Random();
        while(true){
            try {
                theSocket.send(thePacket);
                Thread.sleep(1000*sec.nextInt(10));
            } catch (Exception ex) {
                System.out.println(ex.toString());
            }
        }
    }

}
