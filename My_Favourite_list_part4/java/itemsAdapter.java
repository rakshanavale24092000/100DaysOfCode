package com.rakshanavale.my_favourite_app;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class itemsAdapter extends RecyclerView.Adapter<itemsViewHolder> {

    private Category category;

    public itemsAdapter(Category category) {
        this.category = category;
    }

    @NonNull
    @Override
    public itemsViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view = inflater.inflate(R.layout.items_xml,parent,false);
        return new itemsViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull itemsViewHolder holder, int position) {
        holder.txtAItem.setText(String.valueOf(category.getItems().get(position)));

    }

    @Override
    public int getItemCount() {
        return category.getItems().size();
    }
}
