package com.naxx.game.client;

import com.esotericsoftware.kryonet.Connection;
import com.esotericsoftware.kryonet.Listener;
import com.naxx.game.communication.BoundPlayer;
import com.naxx.game.communication.Data;
import com.naxx.game.communication.EntityData;
import com.naxx.game.communication.LockCamera;
import com.naxx.game.impl.input.KeyboardInput;
import com.naxx.game.inter.input.InputHandler;

public class ClientListener extends Listener {
    
    private NaxxClient client;
    private InputHandler inputHandler;

    public ClientListener(NaxxClient client) {

        this.client = client;
        this.inputHandler = new KeyboardInput(this.client);

        new Thread(this.inputHandler).start();
    }

    public void received (Connection connection, Object object) {

        System.out.println("Client received : " + object.getClass().getSimpleName());
        if (object instanceof Data) {

            if (object instanceof BoundPlayer) {

                this.client.bound(((BoundPlayer) object).getPlayer());
                System.out.println("Player[" + ((BoundPlayer) object).getPlayer() + "] bound.");
            }
            else if (object instanceof LockCamera) {

                this.client.lockCamera(((LockCamera) object).getEntity());
                System.out.println("Target[" + ((LockCamera) object).getEntity() + "] link to Camera.");
            }
            else if (object instanceof EntityData) {

                this.client.handleEntity((EntityData) object);
            }
        }
    }
}