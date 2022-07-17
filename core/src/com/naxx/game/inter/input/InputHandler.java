package com.naxx.game.inter.input;

public interface InputHandler extends Runnable {
    
    public abstract void pause();
    public abstract void resume();

    public abstract void kill();
}