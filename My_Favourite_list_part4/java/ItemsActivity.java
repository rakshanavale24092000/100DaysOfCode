package com.rakshanavale.my_favourite_app;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.Adapter;
import android.widget.EditText;
import android.widget.LinearLayout;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import static com.rakshanavale.my_favourite_app.MainActivity.CATEGORY_ITEMS;

public class ItemsActivity extends AppCompatActivity {

    private RecyclerView itemRecyclerView;
    private FloatingActionButton itemFab;
    Category category;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_items);

        category = (Category) getIntent().getSerializableExtra(MainActivity.CATEGORY_ITEMS);

        setTitle(category.getCategoryName());

        itemRecyclerView = findViewById(R.id.itemRecyclerview);
        itemRecyclerView.setAdapter(new itemsAdapter(category));
        itemRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        itemFab = findViewById(R.id.itemFab);

        itemFab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                itemsDialogBox();


            }
        });
    }

    private void itemsDialogBox(){

        final EditText enterItems = new EditText(this);
        enterItems.setInputType(InputType.TYPE_CLASS_TEXT);

        new AlertDialog.Builder(this)
                .setTitle(R.string.item_dialogTitle)
                .setView(enterItems)
                .setPositiveButton(R.string.item_dialogButton, new DialogInterface.OnClickListener(){


                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        String newItem = enterItems.getText().toString();
                        category.getItems().add(newItem);

                        itemsAdapter itemsAdapter = (itemsAdapter) itemRecyclerView.getAdapter();
                        itemsAdapter.notifyItemInserted(category.getItems().size() - 1);
                    }
                }).create().show();
    }

    @Override
    public void onBackPressed() {

        Bundle bundle = new Bundle();
        bundle.putSerializable(MainActivity.CATEGORY_ITEMS,category);
        Intent intent = new Intent();
        intent.putExtras(bundle);
        setResult(Activity.RESULT_OK,intent);
        super.onBackPressed();
    }
}
