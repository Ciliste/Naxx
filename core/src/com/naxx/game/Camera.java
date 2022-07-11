package com.naxx.game;

import java.util.List;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.naxx.game.inter.IController;
import com.naxx.game.inter.IElement;

public final class Camera {
 
    private int x;
    private int y;

    private List<IElement> elements;
    private static Texture playerPH = new Texture(Gdx.files.internal("placeholder.png"));

    public Camera(IController controller) {

        try {
            this.elements = controller.getElements();
            System.out.println(elements);
        } catch (Exception e) {
            e.printStackTrace();
        }

        new Thread(new Runnable() {
           
            public void run() {


            }
        }).start(); 
    }

    public void draw(SpriteBatch batch) {

        for (IElement ele : this.elements) {

            try {
                batch.draw(Camera.playerPH, ele.getX(), ele.getY());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}