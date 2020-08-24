package com.rakshanavale.inter_fragment_communication;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;

import android.os.Bundle;

public class MainActivity extends AppCompatActivity implements Communator {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override
    public void output(String data) {
        FragmentManager fragmentManager = getSupportFragmentManager();
        FragmentTwo fragmentTwo = (FragmentTwo) fragmentManager.findFragmentById(R.id.fragment2);
        fragmentTwo.textMsg(data);


    }
}
