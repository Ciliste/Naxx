package com.naxx.game.impl;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input.Keys;
import com.naxx.game.IController;
import com.naxx.game.IInputHandler;
import com.naxx.game.common.KeyTranslator;

public class InputHandler implements IInputHandler {

    private IController controller;

    public InputHandler(IController controller) {

        this.controller = controller;
    }

    @Override
    public void run() {
        
        while (true) {

            float dX = 0f;
            float dY = 0f;

            if (Gdx.input.isKeyPressed(KeyTranslator.KEY_UP.getCode())) {

                dX += 1f;
            }

            if (Gdx.input.isKeyPressed(KeyTranslator.KEY_DOWN.getCode())) {

                dX -= 1f;
            }

            if (Gdx.input.isKeyPressed(KeyTranslator.KEY_RIGHT.getCode())) {

                dY += 1f;
            }

            if (Gdx.input.isKeyPressed(KeyTranslator.KEY_LEFT.getCode())) {

                dY -= 1f;
            }

            if (dX != 0f && dY != 0f) dX /= 2; dY /= 2;

            try {
                this.controller.setDX(dX);
                this.controller.setDY(dY);   
            } 
            catch (Exception e) {
                //TODO: handle exception
            }
        }
    }

    @Override
    public void pause() {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void resume() {
        // TODO Auto-generated method stub
        
    }
}