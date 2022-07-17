package com.naxx.game;

import java.util.List;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.naxx.game.client.NaxxClient;
import com.naxx.game.common.TextureLoader;
import com.naxx.game.communication.EntityData;

public final class Camera {
 
    private static final float MID_SCREEN_X = Gdx.graphics.getWidth()  / (float) 2;
    private static final float MID_SCREEN_Y = Gdx.graphics.getHeight() / (float) 2;

    public Camera() {

        
    }

    public void draw(SpriteBatch batch) {

        for (EntityData data : NaxxClient.INSTANCE.getEntitys().values()) {

            batch.draw(TextureLoader.get("placeholder.png"), data.getX(), data.getY());
        }
    }
}