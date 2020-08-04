package com.rakshanavale.fingerspeedgame;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private TextView txtTimer, txtThousand;
    private Button btnTap;

    private CountDownTimer countDownTimer;
    private long intialCountDownMilli = 60000;
    private int interval = 1000;
    private int remaining = 60;
    private int aThousand = 1000;
    private final String REMAINING_TIME = "remaining_time";
    private final String THOUSAND = "thousand";

    @Override
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt(REMAINING_TIME,remaining);
        outState.putInt(THOUSAND,aThousand);
        countDownTimer.cancel();

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtTimer = findViewById(R.id.txtTimer);
        txtThousand = findViewById(R.id.txtThousand);
        btnTap = findViewById(R.id.btnTap);

        txtThousand.setText(aThousand+"");


        if (savedInstanceState != null){
            remaining = savedInstanceState.getInt(REMAINING_TIME);
            aThousand = savedInstanceState.getInt(THOUSAND);
            restore();
        }

        btnTap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                aThousand--;

                txtThousand.setText(aThousand+"");
                if (remaining >0 && aThousand <= 0){
                    Toast.makeText(MainActivity.this,"You Won!!",Toast.LENGTH_LONG).show();
                    Alertdialog("Congratulations!","Would you like to Reset?" );
                }

            }
        });

         if (savedInstanceState == null){

             countDownTimer = new CountDownTimer(intialCountDownMilli, interval) {
                 @Override
                 public void onTick(long millisUntilFinished) {

                     remaining = (int)millisUntilFinished/1000;
                     txtTimer.setText(remaining+"");

                 }

                 @Override
                 public void onFinish() {

                     //Toast.makeText(MainActivity.this, "Countdown finish",Toast.LENGTH_LONG).show();
                     Alertdialog("Finished","Would you like to Reset?" );

                 }
             };
             countDownTimer.start();


         }


    }

    private void restore() {
        int restoreTime = remaining;
        int restoreValue = aThousand;

        txtTimer.setText(Integer.toString(restoreTime));
        txtThousand.setText(Integer.toString(restoreValue));

        CountDownTimer countDownTimer = new CountDownTimer((long)remaining*1000,interval) {
            @Override
            public void onTick(long millisUntilFinished) {
                remaining = (int) millisUntilFinished/1000;
                txtTimer.setText(Integer.toString(remaining));

            }

            @Override
            public void onFinish() {
                Toast.makeText(MainActivity.this, "Countdown finish",Toast.LENGTH_LONG).show();


            }
        };
        countDownTimer.start();

    }

    private void resetGame(){

        if (countDownTimer != null){
            countDownTimer.cancel();  //This can even be written without if statement
           countDownTimer = null;

        }

        aThousand = 1000;
        txtThousand.setText(Integer.toString(aThousand));
        txtTimer.setText(Integer.toString(remaining));

        countDownTimer = new CountDownTimer(intialCountDownMilli,interval) {
            @Override
            public void onTick(long millisUntilFinished) {

                remaining = (int)millisUntilFinished/1000;
                txtTimer.setText(Integer.toString(remaining));

            }

            @Override
            public void onFinish() {
                Toast.makeText(MainActivity.this, "Countdown finish",Toast.LENGTH_LONG).show();

            }
        };
        countDownTimer.start();
    }

    private void Alertdialog(String title, String msg){

          AlertDialog alertDialog = new AlertDialog.Builder(MainActivity.this)
                  .setTitle(title)
                  .setMessage(msg)
                  .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                      @Override
                      public void onClick(DialogInterface dialog, int which) {
                          //set what would happen when button is clicked
                          resetGame();

                      }
                  }).show();
          alertDialog.setCancelable(false);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        getMenuInflater().inflate(R.menu.menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {

        if (item.getItemId() == R.id.info_menu){

            Toast.makeText(MainActivity.this, "The Version is "+BuildConfig.VERSION_NAME, Toast.LENGTH_LONG).show();
        }
        return true;
    }
}








