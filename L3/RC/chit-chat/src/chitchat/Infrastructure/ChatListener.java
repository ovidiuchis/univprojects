/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package chitchat.Infrastructure;


import chitchat.Views.chatFrame;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import javax.swing.JFrame;

/**
 *
 * @author Administrator
 */
public class ChatListener implements Runnable {

    chatFrame chatFrm;
    DatagramSocket socket;
    DatagramPacket packet;

    public ChatListener(JFrame frame, int port) throws SocketException, IOException {
        socket = new DatagramSocket(port);
        chatFrm = (chatFrame)frame;
    }

    public void run(){
        try {
            byte[] buffer = new byte[1024];
            while (buffer.length < 1025) {
                packet = new DatagramPacket(buffer, buffer.length);
                socket.receive(packet);

               

                String received = new String(packet.getData(), 0, packet.getLength());
                
                if(received.indexOf("MESSAGE") == 0){
                    chatFrm.sendMessage(packet.getAddress(), packet.getPort(), received.substring(9));
                }
                if(received.indexOf("JOIN") == 0){
                    chatFrm.addChatter(packet.getAddress(), packet.getPort(), received.substring(6));
                }
                if(received.indexOf("LEAVE") == 0){
                    chatFrm.removeChatter(packet.getAddress(), packet.getPort());
                    System.out.println("Scot un chatter");
                }
            }
        } catch (IOException ex) {
            socket.close();
        }
    }

}
