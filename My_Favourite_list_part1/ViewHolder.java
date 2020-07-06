package com.rakshanavale.my_favourite_app;

import android.view.View;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

public class ViewHolder extends RecyclerView.ViewHolder {

    private TextView txtNumber;
    private TextView txtName;

    public ViewHolder(View view){
        super(view);

        txtNumber = view.findViewById(R.id.txtNumber);
        txtName = view.findViewById(R.id.txtName);

    }

    public TextView getTxtNumber(){
        return txtNumber;
    }

    public TextView getTxtName() {
        return txtName;
    }
}
