package com.naxx.game;

import java.rmi.Remote;

public interface IGameData {
    
    public abstract IConnectionDoor getDoor();
    public abstract void addController(IController controller);
}