package com.naxx.game;

import java.rmi.Remote;

public interface IController extends Remote {
    
    public abstract void setDX(float dX);
    public abstract void setDY(float dY);

    public abstract float getDX();
    public abstract float getDY();
}