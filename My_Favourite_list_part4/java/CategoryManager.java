package com.rakshanavale.my_favourite_app;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.preference.PreferenceManager;

import com.rakshanavale.my_favourite_app.Category;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;

public class CategoryManager {

    private Context context;

    public CategoryManager(Context context){
        this.context = context;
    }

    public void saveSharedPreferences(Category category){

        SharedPreferences preference = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor edit = preference.edit();
        //To convert the array of items to set
        HashSet itemSet = new HashSet(category.getItems());

        edit.putStringSet(category.getCategoryName(),itemSet);

        edit.apply();
    }

    public ArrayList<Category> retriveSharedPreferences(){

//        Map.entrySet() method returns a collection-view(Set<Map.Entry<K, V>>) of
//        the mappings contained in this map. So we can iterate over key-value pair
//        using getKey() and getValue() methods of Map.Entry<K, V>.

        SharedPreferences preference = PreferenceManager.getDefaultSharedPreferences(context);
        Map<String, ?> data = preference.getAll();

        ArrayList<Category> categories = new ArrayList<>();
        for(Map.Entry<String, ?> entry : data.entrySet()){

            Category category = new Category(entry.getKey(),new ArrayList<String>((HashSet) entry.getValue()));
            categories.add(category);


        }
        return categories;

    }
}
