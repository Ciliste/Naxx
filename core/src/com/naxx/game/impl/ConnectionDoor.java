package com.naxx.game.impl;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import com.naxx.game.IConnectionDoor;
import com.naxx.game.IController;

public class ConnectionDoor extends UnicastRemoteObject implements IConnectionDoor {

    private GameData game;

    public ConnectionDoor(GameData game) throws RemoteException {
        
        this.game = game;
    }

    public IController join() throws RemoteException {

        IController controller = new Controller();
        this.game.addController(controller);

        return controller;
    }
}