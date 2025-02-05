package com.example.booklendingapp;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import org.w3c.dom.Text;

public class LoginActivity extends AppCompatActivity {

    EditText emailTextView,passwordTextView;
    TextView mTextView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_login);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });


        //Access the components
        emailTextView = findViewById(R.id.editTextTextEmailAddress);
        passwordTextView = findViewById(R.id.editTextTextPassword);
        mTextView= findViewById(R.id.textView);
        Button loginButton = findViewById(R.id.login);
        Button registerButton = findViewById(R.id.register);


        registerButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //launch the Registeration Activity
                Intent intent = new Intent(LoginActivity.this,RegisterActivity.class);
                startActivity(intent);
            }
        });


        //perform interaction
        loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view)

            {
                Toast.makeText(LoginActivity.this, "Button 1 pressed", Toast.LENGTH_LONG).show();
                Log.d(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ submit Login","submit Login");
                if(emailTextView.getText().toString().equalsIgnoreCase("admin") && passwordTextView.getText().toString().equalsIgnoreCase("admin")){
                    mTextView.setText("Sucess !!");
                    //launch the Registeration Activity
                    Intent intent = new Intent(LoginActivity.this,DashboardActivity.class);
                    startActivity(intent);


                }else{
                    mTextView.setText("Failure !");
                }



            }

        });

    }

    public void submitLogin(View view) {
    }
}