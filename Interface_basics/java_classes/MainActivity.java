package com.rakshanavale.interface_basic;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private Button bJab;
    private Button bCross;
    private Button bHook;
    private Button kJab;
    private Button kCross;
    private Button kHook;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bJab = findViewById(R.id.btnJab);
        kJab = findViewById(R.id.btnJab2);
        bCross = findViewById(R.id.btnCross);
        kCross = findViewById(R.id.btnCross2);
        bHook = findViewById(R.id.btnHook);
        kHook = findViewById(R.id.btnHook2);

        final Boxer boxer = new Boxer();
        final KickBoxer kickBoxer = new KickBoxer();

        bJab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Toast.makeText(MainActivity.this,boxer.throwJab(),Toast.LENGTH_SHORT).show();
            }
        });

        kJab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Toast.makeText(MainActivity.this,kickBoxer.throwJab(),Toast.LENGTH_SHORT).show();
            }
        });

        bHook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Toast.makeText(MainActivity.this,boxer.throwHook(),Toast.LENGTH_SHORT).show();
            }
        });

        kHook.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Toast.makeText(MainActivity.this,kickBoxer.throwHook(),Toast.LENGTH_SHORT).show();
            }
        });

        bCross.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Toast.makeText(MainActivity.this,boxer.throwCross(),Toast.LENGTH_SHORT).show();
            }
        });

        kCross.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Toast.makeText(MainActivity.this,kickBoxer.throwCross(),Toast.LENGTH_SHORT).show();
            }
        });

    }


}
