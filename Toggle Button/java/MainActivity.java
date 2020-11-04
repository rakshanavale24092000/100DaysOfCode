package com.rakshanavale.togglebutton;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;

import android.graphics.Color;
import android.os.Bundle;
import android.widget.CompoundButton;
import android.widget.ToggleButton;

import static android.graphics.Color.GRAY;
import static android.graphics.Color.WHITE;

public class MainActivity extends AppCompatActivity implements CompoundButton.OnCheckedChangeListener {

    private ToggleButton btn;
    private ConstraintLayout constraintLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn = findViewById(R.id.toggleButton);
        constraintLayout = findViewById(R.id.constraint);

        btn.setOnCheckedChangeListener(this);

    }


    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {

        if (isChecked){

            constraintLayout.setBackgroundColor(GRAY);

        }else{

            constraintLayout.setBackgroundColor(WHITE);
        }

    }
}
