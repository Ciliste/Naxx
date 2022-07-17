package com.naxx.game.communication;

import java.time.Instant;

public abstract class Data {
    
    private long timestamp;

    protected Data() {

        this.timestamp = Instant.now().getEpochSecond();
    }

    public long getTimestamp() {return this.timestamp;}
}