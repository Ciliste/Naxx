package com.naxx.game.impl.input;

import com.badlogic.gdx.Gdx;
import com.esotericsoftware.kryonet.Client;
import com.naxx.game.common.KeyTranslator;
import com.naxx.game.communication.ActionData;
import com.naxx.game.communication.ActionData.Action;
import com.naxx.game.inter.input.InputHandler;

public class KeyboardInput implements InputHandler {

    private Client client;

    private boolean isAlive;
    private boolean isRunning;

    public KeyboardInput(Client client) {

        this.client = client;
        this.isRunning = this.isAlive = true;
    }

    @Override
    public void run() {

        boolean up = false;
        boolean down = false;
        boolean left = false;
        boolean right = false;

        boolean dash = false;

        while (this.isAlive) {

            if (this.isRunning) {

                // UP
                if (Gdx.input.isKeyPressed(KeyTranslator.KEY_UP.getCode()) && !up) {

                    up = true;
                    this.client.sendTCP(new ActionData(Action.UP_T));
                }
                else if (!Gdx.input.isKeyPressed(KeyTranslator.KEY_UP.getCode()) && up) {

                    up = false;
                    this.client.sendTCP(new ActionData(Action.UP_F));
                }

                // DOWN
                if (Gdx.input.isKeyPressed(KeyTranslator.KEY_DOWN.getCode()) && !down) {

                    down = true;
                    this.client.sendTCP(new ActionData(Action.DOWN_T));
                }
                else if (!Gdx.input.isKeyPressed(KeyTranslator.KEY_DOWN.getCode()) && down) {

                    down = false;
                    this.client.sendTCP(new ActionData(Action.DOWN_F));
                }

                // LEFT
                if (Gdx.input.isKeyPressed(KeyTranslator.KEY_LEFT.getCode()) && !left) {

                    left = true;
                    this.client.sendTCP(new ActionData(Action.LEFT_T));
                }
                else if (!Gdx.input.isKeyPressed(KeyTranslator.KEY_LEFT.getCode()) && left) {

                    left = false;
                    this.client.sendTCP(new ActionData(Action.LEFT_F));
                }

                // RIGHT
                if (Gdx.input.isKeyPressed(KeyTranslator.KEY_RIGHT.getCode()) && !right) {

                    right = true;
                    this.client.sendTCP(new ActionData(Action.RIGHT_T));
                }
                else if (!Gdx.input.isKeyPressed(KeyTranslator.KEY_RIGHT.getCode()) && right) {

                    right = false;
                    this.client.sendTCP(new ActionData(Action.RIGHT_F));
                }

                // DASH
                if (Gdx.input.isKeyPressed(KeyTranslator.DASH.getCode()) && !dash) {

                    dash = true;
                    this.client.sendTCP(new ActionData(Action.DASH));
                }
                else if (!Gdx.input.isKeyPressed(KeyTranslator.DASH.getCode()) && dash) {

                    dash = false;
                }
            }

            try {
                Thread.sleep(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void pause() {
        
        this.isRunning = false;
    }

    @Override
    public void resume() {
        
        this.isRunning = true;
    }

    @Override
    public void kill() {

        this.isAlive = false;
    }
}