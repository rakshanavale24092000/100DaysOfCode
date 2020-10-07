package com.rakshanavale.conditionalstatements;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    EditText edtFN,edtSN;
    Button btnCalculate;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        edtFN = findViewById(R.id.enter1);
        edtSN = findViewById(R.id.enter2);
        btnCalculate = findViewById(R.id.btnClick);
    }

    public void btnClicked(View buttonView){
        int firstNumber = Integer.parseInt(edtFN.getText().toString());
        int secondNumber = Integer.parseInt(edtSN.getText().toString());

        if(firstNumber>secondNumber){
            btnCalculate.setText("First number is greater than second");
        }else if (secondNumber>firstNumber){
            btnCalculate.setText("Second number is greater");
        }else{
            btnCalculate.setText("Both are Equal");
        }
    }
}
