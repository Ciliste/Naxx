package com.naxx.game;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface IConnectionDoor extends Remote {

    public abstract IController join() throws RemoteException;
}