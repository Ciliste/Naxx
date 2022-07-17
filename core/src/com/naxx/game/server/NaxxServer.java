package com.naxx.game.server;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.EntityDeclaration;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.PolygonShape;
import com.badlogic.gdx.physics.box2d.World;
import com.badlogic.gdx.physics.box2d.BodyDef.BodyType;
import com.esotericsoftware.kryonet.Listener;
import com.esotericsoftware.kryonet.Server;
import com.naxx.game.communication.ActionData;
import com.naxx.game.impl.PlayerImpl;
import com.naxx.game.impl.entity.DebugEntity;
import com.naxx.game.inter.Entity;
import com.naxx.game.inter.Player;

public class NaxxServer extends Server implements PropertyChangeListener {

    public static NaxxServer INSTANCE;

    private static int entityCount = 0;
    public static synchronized int newID() {

        return NaxxServer.entityCount++;
    }

    private World world;
    private List<Entity> entitys;

    private ServerListener listener;

    public NaxxServer() {

        super();

        NaxxServer.INSTANCE = this;

        this.world = new World(new Vector2(0f, 0f), false);
        this.entitys = new ArrayList<Entity>();

        // new Thread(new Runnable() {

        //     @Override
        //     public void run() {

        //         NaxxServer.this.worldLoop();
        //     }
        // }).start();
    }

    public void setServerListener(ServerListener listener) {

        System.out.println(listener + " set.");
        this.listener = listener;
    }

    public Player addPlayer() {

        return new PlayerImpl();
    }  

    public void addEntity(Entity entity) {

        this.entitys.add(entity);

        while (this.listener == null) {}

        this.listener.sendAll(entity);
    }
    
    public void handleAction(ActionData action, Player player) {

        
    }

    public void worldLoop() {

        while (true) {

            if (true) {

                synchronized (this.world) {

                    this.world.step(1 / 60f, 6, 2);
                }
            }
        }
    }

    public World getWorld() {

        return this.world;
    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        
        System.out.println(evt);
    }
}