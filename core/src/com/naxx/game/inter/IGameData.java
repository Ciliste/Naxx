package com.naxx.game.inter;

import java.rmi.Remote;

import com.badlogic.gdx.physics.box2d.World;

public interface IGameData extends Runnable {
    
    public abstract IConnectionDoor getDoor();
    public abstract void addController(IController controller);
}