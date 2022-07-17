package com.naxx.game.client;

import java.util.HashMap;
import java.util.Map;

import com.esotericsoftware.kryonet.Client;
import com.naxx.game.communication.EntityData;
import com.naxx.game.communication.PlayerData;
import com.naxx.game.inter.Entity;
import com.naxx.game.inter.Player;

public class NaxxClient extends Client {

    public static NaxxClient INSTANCE;

    private PlayerData player;

    private Map<Integer, EntityData> entitys;

    private EntityData cameraTarget;

    public NaxxClient() {

        NaxxClient.INSTANCE = this;

        this.entitys = new HashMap<Integer, EntityData>();
    }

    public PlayerData getPlayer() {

        return this.player;
    }

    public void bound(PlayerData data) {

        this.player = data;
    }

    public void lockCamera(EntityData entity) {

        this.cameraTarget = entity;
    }

    public void handleEntity(EntityData data) {

        System.out.println(data);
        this.entitys.put(data.getEntityID(), data);
    }

    public Map<Integer, EntityData> getEntitys() {

        return this.entitys;
    }
}