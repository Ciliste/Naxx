package com.naxx.game.server;

import java.util.HashMap;
import java.util.Map;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.esotericsoftware.kryonet.Connection;
import com.esotericsoftware.kryonet.Listener;
import com.naxx.game.communication.ActionData;
import com.naxx.game.communication.BoundPlayer;
import com.naxx.game.communication.Data;
import com.naxx.game.communication.EntityData;
import com.naxx.game.communication.LockCamera;
import com.naxx.game.communication.PlayerData;
import com.naxx.game.inter.Entity;
import com.naxx.game.inter.Player;

public class ServerListener extends Listener {
 
    private NaxxServer server;

    private Map<Connection, Player> connections;

    public ServerListener(NaxxServer server) {

        super();
        this.server = server;
        this.connections = new HashMap<Connection, Player>();
    }

    @Override
    public void connected(Connection connection) {

        // System.out.println(connection);

        this.connections.put(connection, null);
        this.connections.put(connection, this.server.addPlayer());

        connection.sendTCP(new BoundPlayer(new PlayerData(this.connections.get(connection))));
        connection.sendTCP(new LockCamera(new EntityData(this.connections.get(connection))));
    }

    @Override
    public void received (Connection connection, Object object) {
        
        if (object instanceof Data) {

            if (object instanceof ActionData) {

                server.handleAction((ActionData) object, this.connections.get(connection));
            }
        }
    }

    public void sendAll(Entity entity) {

        System.out.println("Sending to all : " + entity.getClass().getSimpleName());
        for (Connection connection : this.connections.keySet()) {

            System.out.println("Sending to : " + connection);
            connection.sendTCP(new EntityData(entity));
        }
    }
}