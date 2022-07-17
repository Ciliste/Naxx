package com.naxx.game.communication;

import com.naxx.game.inter.Player;

public class BoundPlayer extends Data {
    
    private PlayerData data;

    private BoundPlayer() {

        super();
    }

    public BoundPlayer(PlayerData data) {

        this();
        this.data = data;
    }

    public PlayerData getPlayer() {

        return this.data;
    }
}