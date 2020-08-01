package com.rakshanavale.sharedpreferences;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private TextView txtDisplay;
    private EditText txtEnter;
    private Button btnApply;
    private Switch aSwitch;
    private TextView txtSwitch;
    private Button btnSave;

    private String text;
    private boolean switchOutput;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtDisplay = findViewById(R.id.savedText);
        txtEnter = findViewById(R.id.enter);
        btnApply = findViewById(R.id.apply);
        aSwitch = findViewById(R.id.switch1);
        txtSwitch = findViewById(R.id.txtSwitch);
        btnSave = findViewById(R.id.saved);

        btnApply.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                txtDisplay.setText(txtEnter.getText().toString());
            }
        });

        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                save();
            }
        });

        load();
        updateView();


    }

    public void save(){

        SharedPreferences pref = getSharedPreferences("Data",MODE_PRIVATE);
        SharedPreferences.Editor edit = pref.edit();

        edit.putString("Text",txtEnter.getText().toString());
        edit.putBoolean("switch",aSwitch.isChecked());

        edit.apply();
    }

    public void load(){

        SharedPreferences pref = getSharedPreferences("Data",MODE_PRIVATE);


        switchOutput = pref.getBoolean("switch",false);
        if (switchOutput == false){

            Toast.makeText(MainActivity.this, "Turn on switch to save",Toast.LENGTH_SHORT).show();
        }else{
            text = pref.getString("Text","Nothing is saved");
        }



    }

    public void updateView(){

        txtDisplay.setText(text);
        aSwitch.setChecked(false);
    }
}
