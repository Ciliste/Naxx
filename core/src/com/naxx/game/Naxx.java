package com.naxx.game;

import java.net.InetAddress;
import java.rmi.Naming;
import java.rmi.registry.LocateRegistry;

import com.badlogic.ashley.core.Family.Builder;
import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Game;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input.Keys;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.PerspectiveCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.g3d.Environment;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.ModelBatch;
import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute;
import com.badlogic.gdx.graphics.g3d.utils.ModelBuilder;
import com.badlogic.gdx.utils.ScreenUtils;
import com.naxx.game.common.Constants;
import com.naxx.game.impl.GameData;
import com.naxx.game.impl.InputHandler;

public class Naxx extends Game {
	
	public static Naxx INSTANCE;

	private IGameData data;

	private int screenWidth, screenHeight;
	private OrthographicCamera camera;

	private IInputHandler inputHandler;

	public Naxx() {

		Naxx.INSTANCE = this;
	}

	@Override
	public void create () {

		this.data = new GameData();

		try {
		
			LocateRegistry.createRegistry(Constants.PORT);

			String url = "rmi://" + InetAddress.getLocalHost().getHostAddress() + ":" + Constants.PORT + "/Naxx";
			System.out.println("Enregistrement de l'objet avec l'url : " + url);
			Naming.rebind(url, this.data.getDoor());
		} 
		catch (Exception e) {

			e.printStackTrace();
		}

		this.screenWidth  = Gdx.graphics.getWidth();
		this.screenHeight = Gdx.graphics.getHeight();

		this.camera = new OrthographicCamera();
		this.camera.setToOrtho(false, this.screenWidth, this.screenHeight);
		setScreen(new GameScreen(this.camera));

		try {
			
			IController controller = ((IConnectionDoor) Naming.lookup("rmi://" + InetAddress.getLocalHost().getHostAddress() + ":" + Constants.PORT + "/Naxx")).join();
			this.inputHandler = new InputHandler(controller);
			new Thread(this.inputHandler).start();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void render () {
		super.render();
	}

	@Override
	public void dispose() {

		super.dispose();
	}
}
