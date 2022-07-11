package com.naxx.game;

import java.rmi.Remote;

public interface ICameraTarget extends Remote {
 
    public abstract int getX();
    public abstract int getY();
}