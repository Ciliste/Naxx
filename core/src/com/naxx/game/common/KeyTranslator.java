package com.naxx.game.common;

import com.badlogic.gdx.Input.Keys;

public enum KeyTranslator {
    
    KEY_UP(Keys.W),
    KEY_DOWN(Keys.S),
    KEY_LEFT(Keys.A),
    KEY_RIGHT(Keys.D),
    DASH(Keys.SPACE);

    private int code;

    private KeyTranslator(int code) {

        this.code = code;
    }

    public int getCode() {return this.code;}
}