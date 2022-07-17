package com.naxx.game.impl;

import com.naxx.game.impl.entity.EntityWithID;
import com.naxx.game.inter.Player;

public class PlayerImpl extends EntityWithID implements Player {

    private int ID;

    private float x, y;


    public PlayerImpl() {

        this.x = 100;
        this.y = 100;
    }

    @Override
    public int getEntityID() {
        
        return this.ID;
    }

    public String toString() {

        return String.format("%d", this.ID);
    }

    @Override
    public float getX() {
        
        return this.x;
    }

    @Override
    public float getY() {
        
        return this.y;
    }
}