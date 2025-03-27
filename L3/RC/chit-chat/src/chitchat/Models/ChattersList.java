/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package chitchat.Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class ChattersList {

    List<Chatter> list;

    public ChattersList(){
        this.list = new ArrayList<Chatter>();
    }
    public int  size(){
        return list.size();
    }

    public void add(Chatter unu){
        this.list.add(unu);
    }

    public boolean contains(Chatter unu){
        return this.list.contains(unu);
    }

    public Chatter remove(Chatter unu){
        return this.list.remove(this.list.indexOf(unu));

    }

    public Chatter update(Chatter chatter){
       /* for(Chatter achatter : list){
            if (achatter.equals(chatter)){
                achatter.updateTimestamp();
            if (!chatter.getName().equals("Doe"))
                achatter.setName(chatter.getName());
            }
            return achatter;
        }*/
        
        for(int i = 0; i < list.size(); i++){
            if(list.get(i).equals(chatter)){
                list.get(i).updateTimestamp();
                if(!chatter.getName().equals("Doe"))
                    list.get(i).setName(chatter.getName() );
                return list.get(i);
            }
        }
        return null;
    }

    public List<Chatter> get(){
        return this.list;
    }

   
}
