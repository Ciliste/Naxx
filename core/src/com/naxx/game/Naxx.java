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
import com.esotericsoftware.kryo.Kryo;
import com.esotericsoftware.kryonet.Client;
import com.esotericsoftware.kryonet.Server;
import com.naxx.game.client.ClientListener;
import com.naxx.game.client.NaxxClient;
import com.naxx.game.common.Constants;
import com.naxx.game.impl.entity.DebugEntity;
import com.naxx.game.server.KryoClassEnum;
import com.naxx.game.server.NaxxServer;
import com.naxx.game.server.ServerListener;

public class Naxx extends Game {
	
	public static Naxx INSTANCE;

	public Naxx() {

		Naxx.INSTANCE = this;
	}

	@Override
	public void create() {

		System.out.println("shesh");
		NaxxServer server = new NaxxServer();
		KryoClassEnum.setupKryo(server.getKryo());

		server.start();
		try {
			server.bind(6969, 6996);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ServerListener temp = new ServerListener(server);
		server.addListener(temp);
		server.setServerListener(temp);

		System.out.println("shesh");
		NaxxClient client = new NaxxClient();
		KryoClassEnum.setupKryo(client.getKryo());

		client.start();
		try {
			client.connect(5000, "localhost", 6969, 6996);
		} catch (Exception e) {
			e.printStackTrace();
		}
		client.addListener(new ClientListener(client));

		System.out.println("shesh");
		setScreen(new GameScreen());

		new DebugEntity();
	}
}
