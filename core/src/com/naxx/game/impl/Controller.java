package com.naxx.game.impl;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import com.naxx.game.IController;

public class Controller extends UnicastRemoteObject implements IController {
    
    private float dX;
    private float dY;

    public Controller() throws RemoteException {

        this.dX = this.dY = 0f;
    }

    @Override
    public void setDX(float dX) {
        
        this.dX = dX;
    }

    @Override
    public void setDY(float dY) {
        
        this.dY = dY;
    }

    @Override
    public float getDX() {
        
        return this.dX;
    }

    @Override
    public float getDY() {
        
        return this.dY;
    }
}