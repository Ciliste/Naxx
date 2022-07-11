package com.naxx.game;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

import com.badlogic.gdx.physics.box2d.World;

public interface IController extends Remote {
    
    public abstract void setDX(float dX) throws RemoteException;
    public abstract void setDY(float dY) throws RemoteException;

    public abstract float getDX() throws RemoteException;
    public abstract float getDY() throws RemoteException;

    public abstract void setCameraTarget(ICameraTarget target) throws RemoteException;
    public abstract ICameraTarget getCameraTarget() throws RemoteException;

    public abstract List<IElement> getElements() throws RemoteException;
}