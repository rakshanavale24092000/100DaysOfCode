package com.rakshanavale.jobcriteria;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText ed1,ed2;
    Button btnClick;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ed1 = findViewById(R.id.editText1);
        ed2 = findViewById(R.id.editText2);
        btnClick = findViewById(R.id.button);
    }

    public void qualify(View buttonView){
        int age = Integer.parseInt(ed1.getText().toString());
        String developer = ed2.getText().toString();

        if (age > 18 && developer.equals("Yes")){

            Toast.makeText(this,"YOU GOT THE JOB",Toast.LENGTH_LONG).show();
        }else{

            Toast.makeText(this,"YOU DID NOT GET THE JOB",Toast.LENGTH_LONG).show();
        }
    }
}
