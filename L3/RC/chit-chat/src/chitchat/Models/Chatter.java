/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package chitchat.Models;

import java.net.InetAddress;
import java.util.Calendar;

/**
 *
 * @author Administrator
 */
public class Chatter {
    InetAddress address;
    long timestamp;
    int port;
    String name;


    public Chatter(InetAddress addr, int port, String name){
        this.address = addr;
        this.port = port;
        this.name = name;

        this.timestamp = Calendar.getInstance().getTimeInMillis();//ultima operatie
    }

    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }

    public InetAddress getAddress(){
        return this.address;
    }

    public int getPort(){
        return this.port;
    }

    public void updateTimestamp(){
        this.timestamp = Calendar.getInstance().getTimeInMillis();
    }

    public boolean equals(Object bChatter){
        Chatter c = (Chatter)bChatter;
        return this.address.equals(c.address) && (this.port == c.port);
    }

    public String toString(){
        return  this.name +   " @ " + this.address.toString() + ":" + this.port;
    }

    public boolean isIdle() {
        long t2=Calendar.getInstance().getTimeInMillis();

        System.out.println(t2 +" "+ timestamp);
        if ((t2-timestamp)/1000 > 7){

            System.out.println(this.name + " a fost gasit idle");
            return true;
        }
        else{

            System.out.println(this.name + " active");
            return false;
        }
    }

}