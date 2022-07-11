package com.naxx.game.impl;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import com.naxx.game.inter.IElement;
import com.naxx.game.inter.IPlayer;

public class Player extends UnicastRemoteObject implements IPlayer, IElement {

    private int x;
    private int y;

    public Player() throws RemoteException {

        this.x = this.y = 0;
    }

    @Override
    public int getCameraX() {
        
        return this.x;
    }

    @Override
    public int getCameraY() {

        return this.y;
    }

    @Override
    public int getX() {
        
        return this.x;
    }

    @Override
    public int getY() {
        
        return this.y;
    }

    @Override
    public String getSpriteRef() throws RemoteException {

        return null;
    }
}