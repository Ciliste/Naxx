package com.naxx.game.impl.entity;

import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.PolygonShape;
import com.badlogic.gdx.physics.box2d.BodyDef.BodyType;
import com.naxx.game.inter.Entity;
import com.naxx.game.server.NaxxServer;

import java.beans.*;

public abstract class EntityWithID implements Entity {
    
    private final int ID;
    private final Body body;

    private final PropertyChangeSupport support = new PropertyChangeSupport(this);

    protected EntityWithID() {

        this(0, 0);
    }

    protected EntityWithID(float x, float y) {

        this.ID = NaxxServer.newID(); 
        this.support.addPropertyChangeListener(NaxxServer.INSTANCE);

        synchronized (NaxxServer.INSTANCE.getWorld()) {

            BodyDef def = new BodyDef();
            def.position.set(x, y);
            def.type = BodyType.DynamicBody;
            def.fixedRotation = true;

            this.body = NaxxServer.INSTANCE.getWorld().createBody(def);

            PolygonShape shape = new PolygonShape();
            shape.setAsBox(1, 1);

            this.body.createFixture(shape, 1.0f);
        }

        NaxxServer.INSTANCE.addEntity(this);
    }

    @Override
    public int getEntityID() {

        return this.ID;
    }

    @Override
    public float getX() {

        return this.body.getPosition().x;
    }

    @Override
    public float getY() {

        return this.body.getPosition().y;
    }
}