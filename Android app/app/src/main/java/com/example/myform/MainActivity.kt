package com.example.myform

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import com.example.myform.databinding.ActivityMainBinding
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private lateinit var database: DatabaseReference

    private lateinit var firstName: String
    private lateinit var secondName: String
    private lateinit var emailAddress: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.registerBtn.setOnClickListener {

            firstName = binding.firstName.text.toString()
            secondName = binding.secondName.text.toString()
            emailAddress = binding.emailAddress.text.toString()

            database = FirebaseDatabase.getInstance().getReference("Users")
            val user = User(firstName, secondName, emailAddress)
            val u1 = User("rumini", "bumini", "brumini@hotmail.com")
            database.child(firstName).setValue(u1)
            if (binding.firstName.text.toString().isEmpty(), binding.secondName.text.toString().isEmpty(), binding.emailAddress.text.toString().isEmpty())
                 Toast.makeText(this, R.string.warn_message, Toast.LENGTH_SHORT).show()
            else{
                database.child(firstName).setValue(u1)
                database.child(firstName).setValue(user).addOnSuccessListener {
                    binding.firstName.text.clear()
                    binding.secondName.text.clear()
                    binding.emailAddress.text.clear()

                    Toast.makeText(this, R.string.success_message, Toast.LENGTH_SHORT).show()
                }
                 .addOnFailureListener {

                    }
            }
        }           
    }
}
