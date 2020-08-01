package com.rakshanavale.thepetage;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {

    public void calculateButton(View buttonView)
    {

        EditText editPet=findViewById(R.id.editText);
        int petAge= Calendar.getInstance().get(Calendar.YEAR)-Integer.parseInt(editPet.getText().toString());
        TextView petDisplay=findViewById(R.id.textView);
        petDisplay.setText(petAge+"");

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);



    }
}
