package com.naxx.game.inter;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IConnectionDoor extends Remote {

    public abstract IController join() throws RemoteException;
}