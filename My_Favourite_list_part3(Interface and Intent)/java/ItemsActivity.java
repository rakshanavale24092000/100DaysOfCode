package com.rakshanavale.my_favourite_app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import static com.rakshanavale.my_favourite_app.MainActivity.CATEGORY_ITEMS;

public class ItemsActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_items);

        Category category = (Category) getIntent().getSerializableExtra(CATEGORY_ITEMS);

        setTitle(category.getCategoryName());
    }
}
