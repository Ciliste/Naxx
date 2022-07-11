package com.naxx.game;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface ICameraTarget extends Remote {
 
    public abstract int getCameraX() throws RemoteException;
    public abstract int getCameraY() throws RemoteException;
}