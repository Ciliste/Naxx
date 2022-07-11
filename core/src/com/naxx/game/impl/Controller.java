package com.naxx.game.impl;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.World;
import com.naxx.game.ICameraTarget;
import com.naxx.game.IController;

public class Controller extends UnicastRemoteObject implements IController {
    
    private float dX;
    private float dY;

    public World world; 

    private ICameraTarget cameraTarget;

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

    @Override
    public void setCameraTarget(ICameraTarget target) {
        
        this.cameraTarget = target;
    }

    @Override
    public ICameraTarget getCameraTarget() {
        
        return this.cameraTarget;
    }
}