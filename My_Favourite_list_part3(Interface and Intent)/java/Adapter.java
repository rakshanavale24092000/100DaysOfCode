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

    interface viewIsClicked{

        void isClicked(Category category);

    }
    public viewIsClicked viewIsClicked;

    public Adapter(ArrayList<Category> categories, viewIsClicked clicked){
        this.categories = categories;
        this.viewIsClicked = clicked;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view = inflater.inflate(R.layout.row,parent,false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull final ViewHolder holder, final int position) {

        holder.getTxtNumber().setText(Integer.toString(position+1));
        holder.getTxtName().setText(categories.get(position).getCategoryName());
        holder.itemView.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View v) {

                viewIsClicked.isClicked(categories.get(position));

            }

        });

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
