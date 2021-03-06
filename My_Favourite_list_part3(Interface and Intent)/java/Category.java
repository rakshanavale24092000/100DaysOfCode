package com.rakshanavale.my_favourite_app;

import java.io.Serializable;
import java.util.ArrayList;

public class Category implements Serializable {

    private String categoryName;
    private ArrayList<String> items = new ArrayList<>();


    public Category(String categoryName, ArrayList<String> items) {
        this.categoryName = categoryName;
        this.items = items;
    }

    public String getCategoryName(){
        return categoryName;
    }

    public ArrayList<String> getItems(){
        return items;

    }
}
