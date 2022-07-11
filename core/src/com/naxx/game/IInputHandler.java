package com.naxx.game;

public interface IInputHandler extends Runnable {
    
    public abstract void pause();
    public abstract void resume();
}