package com.rakshanavale.styleabletoast;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Toast;

import com.muddzdev.styleabletoastlibrary.StyleableToast;

public class MainActivity extends AppCompatActivity {




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


    }

    public void click(View buttonView){

        StyleableToast.makeText(this,"This toast is Styled",R.style.styletoast,Toast.LENGTH_LONG).show();
//       Toast toast = Toast.makeText(this,"This toast is not Styled",Toast.LENGTH_LONG);
//       toast.setGravity(Gravity.TOP|Gravity.CENTER_HORIZONTAL,0,0);
//       toast.show();



    }

}
