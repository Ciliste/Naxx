package com.naxx.game.communication;

import com.naxx.game.inter.Entity;

public class EntityData<E extends Entity> extends Data {
    
    private int entityID;
    private float x, y;

    private EntityData() {}

    public EntityData(Entity entity) {

        super();
        
        this.entityID = entity.getEntityID();
        this.x = entity.getX();
        this.y = entity.getY();
    }

    public int getEntityID() {

        return this.entityID;
    }

    public float getX() {

        return this.x;
    }

    public float getY() {

        return this.y;
    }
}