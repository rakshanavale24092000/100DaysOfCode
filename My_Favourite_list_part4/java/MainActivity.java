package com.rakshanavale.my_favourite_app;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.text.InputType;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.LinearLayout;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity implements Adapter.viewIsClicked {

    private RecyclerView recyclerView;
    private CategoryManager mCategoryManager = new CategoryManager(this);

    public static final String CATEGORY_ITEMS = "ITEMS";
    public static final int MAINACTIVITY_REQUESTCODE = 1000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        ArrayList<Category> categories = mCategoryManager.retriveSharedPreferences();

        recyclerView = findViewById(R.id.recyclerView);
        recyclerView.setAdapter(new Adapter(categories,this));
        recyclerView.setLayoutManager(new LinearLayoutManager(getApplicationContext()));

        FloatingActionButton fab = findViewById(R.id.fab);

        fab.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View view){

                onCreateDialog();

            }
        });


    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    private void onCreateDialog(){

        String title = getString(R.string.alert_title);
        String positive_button = getString(R.string.alert_positive_button);
        final EditText edtText = new EditText(MainActivity.this);
        edtText.setInputType(InputType.TYPE_CLASS_TEXT);
        AlertDialog.Builder categoryAlert = new AlertDialog.Builder(MainActivity.this);

        categoryAlert.setTitle(title);
        categoryAlert.setView(edtText);
        categoryAlert.setPositiveButton(positive_button, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {

                Category category = new Category(edtText.getText().toString(), new ArrayList<String>());
                mCategoryManager.saveSharedPreferences(category);

                Adapter adapter = (Adapter) recyclerView.getAdapter();
                adapter.add(category);

                dialog.dismiss();
                items(category);

            }
        });

        categoryAlert.create().show();
    }

    public void items(Category category){

        Intent items = new Intent(this,ItemsActivity.class);
        items.putExtra(CATEGORY_ITEMS,category);
        startActivityForResult(items,MAINACTIVITY_REQUESTCODE);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == MAINACTIVITY_REQUESTCODE && resultCode == Activity.RESULT_OK){

            if (data != null){

                mCategoryManager.saveSharedPreferences((Category) data.getSerializableExtra(CATEGORY_ITEMS));
                updateCategories();

            }
        }

    }

    private void updateCategories() {

        ArrayList<Category> categories= mCategoryManager.retriveSharedPreferences();

        recyclerView.setAdapter(new Adapter(categories,this));
    }


    @Override
    public void isClicked(Category category) {
        items(category);
    }
}
