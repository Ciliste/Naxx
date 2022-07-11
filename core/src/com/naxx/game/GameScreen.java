package com.naxx.game;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.ScreenAdapter;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Box2DDebugRenderer;
import com.badlogic.gdx.physics.box2d.World;
import com.naxx.game.common.Constants;

public class GameScreen extends ScreenAdapter {
 
    private OrthographicCamera camera;
    private SpriteBatch batch;
    private World world;
    private Box2DDebugRenderer debugRenderer;

    public GameScreen(OrthographicCamera camera) {

        this.camera = camera;

        this.batch = new SpriteBatch();
        this.world = new World(new Vector2(0, 0), false);
        
        this.debugRenderer = new Box2DDebugRenderer();
    }

    private void update() {

        this.world.step(1/60f, 6, 2);
        this.batch.setProjectionMatrix(this.camera.combined);
    }

    @Override
    public void render(float delta) {

        this.update();

        Gdx.gl.glClearColor(0, 0, 0, 1);
        Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);

        this.batch.begin();

        this.batch.end();
        this.debugRenderer.render(this.world, this.camera.combined.scl(Constants.PPM));
    }
}