package com.naxx.game;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IElement extends Remote {
    
    public abstract int getX() throws RemoteException;
    public abstract int getY() throws RemoteException;

    public abstract String getSpriteRef() throws RemoteException;
}