package com.naxx.game.communication;

import com.naxx.game.inter.Entity;

public class LockCamera extends Data {
    
    private EntityData entity;

    private LockCamera() {

        super();
    }

    public LockCamera(EntityData entity) {

        this();
        this.entity = entity;
    }

    public EntityData getEntity() {

        return this.entity;
    }
}