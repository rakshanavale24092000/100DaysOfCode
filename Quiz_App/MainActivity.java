package com.rakshanavale.the_quiz_app;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

     private TextView mTextQuestion;
     private Button btnTrue;
     private Button btnFalse;
     private int mQuestionIndex;
     private int mQuizQuestion;
     private TextView quizStat;
     private ProgressBar mProgressBar;
     private int score;
     private final String SCORE_KEY="SCORE";
     private final String INDEX_KEY="INDEX";
     private final String ALERT="ALERT";
     private AlertDialog.Builder quizAlert;




     private QuizModel[] questionCollection = new QuizModel[] {

             new QuizModel(R.string.q1,true),
             new QuizModel(R.string.q2,false),
             new QuizModel(R.string.q3,true),
             new QuizModel(R.string.q4,false),
             new QuizModel(R.string.q5,true),
             new QuizModel(R.string.q6,false),
             new QuizModel(R.string.q7,true),
             new QuizModel(R.string.q8,false),
             new QuizModel(R.string.q9,true),
             new QuizModel(R.string.q10,false),

     };

     final int USER_PROGRESS =(int) Math.ceil(100.0/questionCollection.length);


    protected void onCreate(Bundle savedInstanceState) {
        Toast.makeText(this, "OnCreate is called", Toast.LENGTH_LONG).show();
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        quizStat = findViewById(R.id.textQuizStat);



        mTextQuestion = findViewById(R.id.textQuestion);

        QuizModel Q = questionCollection[mQuestionIndex];
        mQuizQuestion = Q.getmQuestion();
        mTextQuestion.setText(getText(mQuizQuestion));


        mProgressBar = findViewById(R.id.quizPB);
        btnTrue = findViewById(R.id.btnTrue);


        btnTrue.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                evaluateAnswer(true);
                changeQuestion();

            }
        });

        btnFalse = findViewById(R.id.btnFalse);

        btnFalse.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                evaluateAnswer(false);
                changeQuestion();

            }
        });


    }

    private void changeQuestion(){

       mQuestionIndex = (mQuestionIndex+1)%10;

       if(mQuestionIndex == 0){

           quizAlert = new AlertDialog.Builder(this);
           quizAlert.setCancelable(false);
           quizAlert.setTitle("The Quiz is Finished");
           quizAlert.setMessage("Your score is "+score);
           quizAlert.setPositiveButton("Finish the quiz", new DialogInterface.OnClickListener() {
               @Override
               public void onClick(DialogInterface dialog, int which) {

                   finish();

               }
           });quizAlert.show();

       }

        mQuizQuestion=questionCollection[mQuestionIndex].getmQuestion();
        mTextQuestion.setText(getText(mQuizQuestion));
        mProgressBar.incrementProgressBy(USER_PROGRESS);
        quizStat.setText("THE SCORE: "+score);

    }

    private void evaluateAnswer(boolean userGuess){

        boolean correctAnswer = questionCollection[mQuestionIndex].ismAnswer();

        if (correctAnswer == userGuess) {

            Toast.makeText(getApplicationContext(), R.string.correct_toast_message, Toast.LENGTH_LONG).show();
            score = score+1;
        }else {

            Toast.makeText(getApplicationContext(),R.string.Incorrect_toast_message,Toast.LENGTH_LONG).show();
        }
    }

    @Override
    protected void onStart() {
        super.onStart();
        Toast.makeText(this, "OnStart is called", Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onResume() {
        super.onResume();
        Toast.makeText(this, "OnResume is called", Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onPause() {
        super.onPause();
        Toast.makeText(this, "OnPause is called", Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onStop() {
        super.onStop();
        Toast.makeText(this, "OnStop is called", Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Toast.makeText(this, "OnDestroy is called", Toast.LENGTH_LONG).show();
    }

    @Override
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);

        outState.putInt(SCORE_KEY,score);
        outState.putInt(INDEX_KEY,mQuestionIndex);



    }

    @Override
    protected void onRestoreInstanceState(@NonNull Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);

        score = savedInstanceState.getInt(SCORE_KEY);
        mQuestionIndex = savedInstanceState.getInt(INDEX_KEY);

        quizStat.setText(score+"");
    }
}
