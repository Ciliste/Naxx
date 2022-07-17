package com.naxx.game.common;

import java.util.HashMap;
import java.util.Map;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;

public final class TextureLoader {
    
    private static Map<String, Texture> loadedTextures = new HashMap<String, Texture>();

    private TextureLoader() {}

    public static Texture get(String ref) {

        if (!TextureLoader.loadedTextures.containsKey(ref)) {

            TextureLoader.load(ref);
        }

        return TextureLoader.loadedTextures.get(ref);
    }

    private static void load(String ref) {

        TextureLoader.loadedTextures.put(ref, new Texture(Gdx.files.internal(ref)));
    }
}