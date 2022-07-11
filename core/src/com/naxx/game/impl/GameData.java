package com.naxx.game.impl;

import java.util.ArrayList;
import java.util.List;

import com.naxx.game.IConnectionDoor;
import com.naxx.game.IController;
import com.naxx.game.IGameData;
import com.naxx.game.IPlayer;

public final class GameData implements IGameData {
    
    private IConnectionDoor door;
    private List<IController> lstController;

    private List<IPlayer> players;

    public GameData() {

        try {
            
            this.door = new ConnectionDoor(this);
            this.lstController = new ArrayList<IController>();
        } 
        catch (Exception e) {
            
            e.printStackTrace();
        }

        this.players = new ArrayList<IPlayer>();
    }

    @Override
    public IConnectionDoor getDoor() {

        return this.door;
    }

    @Override
    public void addController(IController controller) {

        controller.set
        
        this.lstController.add(controller);
    }
}