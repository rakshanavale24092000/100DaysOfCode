package com.rakshanavale.my_favourite_app;

import android.view.View;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

public class itemsViewHolder extends RecyclerView.ViewHolder {

    public TextView txtAItem;

    public itemsViewHolder(View view){
        super(view);
        txtAItem = view.findViewById(R.id.txtItem);
    }
}
