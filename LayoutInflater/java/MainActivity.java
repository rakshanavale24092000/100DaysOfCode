package com.rakshanavale.layout_inflater;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

public class MainActivity extends AppCompatActivity {

    private Object MainActivity;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Adding parent layout manually for sublayout
        LayoutInflater i = getLayoutInflater();
        View v = i.inflate(R.layout.sublayout,null);
        LinearLayout l = findViewById(R.id.linear);
        l.addView(v);


        //View view = inflate.inflate(R.layout.sublayout2,ViewGroup parent);

    }
}
