package com.naxx.game.server;

import com.esotericsoftware.kryo.Kryo;
import com.naxx.game.communication.ActionData;
import com.naxx.game.communication.BoundPlayer;
import com.naxx.game.communication.Data;
import com.naxx.game.communication.EntityData;
import com.naxx.game.communication.LockCamera;
import com.naxx.game.communication.PlayerData;
import com.naxx.game.communication.ActionData.Action;
import com.naxx.game.impl.PlayerImpl;
import com.naxx.game.inter.EntityID;
import com.naxx.game.inter.Player;

public enum KryoClassEnum {
    
    ENTITYID(EntityID.class),
    PLAYER(Player.class),
    PLAYERIMPL(PlayerImpl.class),
    DATA(Data.class),
    BOUNDPLAYER(BoundPlayer.class),
    LOCKCAMERA(LockCamera.class),
    ACTIONDATA(ActionData.class),
    ACTION(Action.class),
    ENTITYDATA(EntityData.class),
    PLAYERDATA(PlayerData.class);

    private Class<?> classe;

    private KryoClassEnum(Class<?> classe) {

        this.classe = classe;
    }

    public static void setupKryo(Kryo kryo) {

        for (KryoClassEnum classe : KryoClassEnum.values()) {

            kryo.register(classe.classe);
        }
    }
}