package com.rakshanavale.my_favourite_app;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class Adapter extends RecyclerView.Adapter<ViewHolder> {

    //String[] categories = {"Books","Games","Movies","Food","Tv_Series","Gadgets"};
    private ArrayList<Category> categories = new ArrayList<>();

    public Adapter(ArrayList<Category> categories){
        this.categories = categories;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view = inflater.inflate(R.layout.row,parent,false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {

        holder.getTxtNumber().setText(Integer.toString(position+1));
        holder.getTxtName().setText(categories.get(position).getCategoryName());

    }

    @Override
    public int getItemCount() {
        return categories.size();
    }

    public void add(Category category){

        categories.add(category);
        notifyItemInserted(categories.size() - 1);
    }
}
