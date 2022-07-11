package com.naxx.game.impl;

import com.naxx.game.IPlayer;

public class Player implements IPlayer {

    private int x;
    private int y;

    @Override
    public int getCameraX() {
        
        return this.x;
    }

    @Override
    public int getCameraY() {

        return this.y;
    }
}