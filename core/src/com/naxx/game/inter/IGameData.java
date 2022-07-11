package com.naxx.game;

import java.rmi.Remote;

import com.badlogic.gdx.physics.box2d.World;

public interface IGameData {
    
    public abstract IConnectionDoor getDoor();
    public abstract void addController(IController controller);
}