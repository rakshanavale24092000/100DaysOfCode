package com.rakshanavale.interface_basic;

public class Boxer implements Fighter {

    @Override
    public String throwJab() {
        return "Boxer throws jab";
    }

    @Override
    public String throwCross() {
        return "Boxer throws cross";
    }

    @Override
    public String throwHook() {
        return "Boxer throws hook";
    }
}
