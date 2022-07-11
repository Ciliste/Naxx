package com.naxx.game.impl;

import java.util.ArrayList;
import java.util.List;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.World;
import com.naxx.game.inter.IConnectionDoor;
import com.naxx.game.inter.IController;
import com.naxx.game.inter.IGameData;
import com.naxx.game.inter.IPlayer;

public final class GameData implements IGameData, Runnable {
    
    private IConnectionDoor door;
    private List<IController> lstController;

    private World world;

    private List<IPlayer> players;

    private List<Object> map;
    private List<Object> terrain;

    public GameData() {

        try {
            
            this.door = new ConnectionDoor(this);
            this.lstController = new ArrayList<IController>();
        } 
        catch (Exception e) {
            
            e.printStackTrace();
        }

        this.world = new World(new Vector2(0, 0), false);

        this.players = new ArrayList<IPlayer>();
    }

    @Override
    public IConnectionDoor getDoor() {

        return this.door;
    }

    @Override
    public void addController(IController controller) {
        
        try {
            Player player = new Player();
            this.players.add(player);
            controller.setCameraTarget(player);
            controller.getElements().add(player);
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        
        this.lstController.add(controller);
    }

    @Override
    public void run() {
        
        
    }
}