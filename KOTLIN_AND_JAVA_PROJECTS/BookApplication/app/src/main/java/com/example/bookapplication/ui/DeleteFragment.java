package com.example.bookapplication.ui;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

import com.example.bookapplication.R;

public class DeleteFragment extends Fragment {


    EditText idBook;
    Button  deleteBtn;
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view= inflater.inflate(R.layout.fragment_delete, container, false);
        idBook= view.findViewById(R.id.idBook);
        deleteBtn=view.findViewById(R.id.deleteBtn);


        return view;
    }
}