package com.naxx.game.communication;

public class ActionData extends Data {
    
    private Action action;

    private ActionData() {super();}

    public ActionData(Action action) {

        this.action = action;
    }

    public enum Action {UP_T, UP_F, DOWN_T, DOWN_F, LEFT_T, LEFT_F, RIGHT_T, RIGHT_F, DASH}
}