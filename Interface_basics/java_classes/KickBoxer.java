package com.rakshanavale.interface_basic;

public class KickBoxer implements Fighter {

    @Override
    public String throwJab() {
        return "Kickboxer throws jab";
    }

    @Override
    public String throwCross() {
        return "Kickboxer throws cross";
    }

    @Override
    public String throwHook() {
        return "Kickboxer throws hook";
    }
}
