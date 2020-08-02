package com.rakshanavale.passing_data_between_activities;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class SecondActivity extends AppCompatActivity {

    private TextView hello;
    private TextView txt2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        hello=findViewById(R.id.txt2);
        txt2=findViewById(R.id.textView2);

        txt2.setText(getIntent().getStringExtra(MainActivity.DATA_PASS));
    }
}
