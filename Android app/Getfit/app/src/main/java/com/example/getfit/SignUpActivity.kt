package com.example.getfit

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import api.RetrofitClient
import com.example.getfit.databinding.ActivityHomeScreenBinding
import com.example.getfit.databinding.ActivityLoginBinding
import com.example.getfit.databinding.ActivitySignUpBinding
import data.DefaultResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class SignUpActivity : AppCompatActivity() {

    private lateinit var binding: ActivitySignUpBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignUpBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnSubmit.setOnClickListener{

            val name = binding.personName.text.toString().trim()
            val userName= binding.userName.text.toString().trim()
            val email= binding.emailAddress.text.toString().trim()
            val password= binding.password.text.toString().trim()

            if(name.isEmpty()){
                binding.personName.error = "Name is required!"
                binding.personName.requestFocus()
                return@setOnClickListener
            }

            if(userName.isEmpty()){
                binding.userName.error = "User name is required!"
                binding.userName.requestFocus()
                return@setOnClickListener
            }

            if(email.isEmpty()){
                binding.emailAddress.error = "Email is required!"
                binding.emailAddress.requestFocus()
                return@setOnClickListener
            }

            if(password.isEmpty()){
                binding.password.error = "Password is required!"
                binding.password.requestFocus()
                return@setOnClickListener
            }

            RetrofitClient.instance.createUser(name, userName, email, password)
                .enqueue(object :Callback<DefaultResponse>{
                    override fun onResponse(
                        call: Call<DefaultResponse>,
                        response: Response<DefaultResponse>
                    ) {
                        Toast.makeText(applicationContext, response.body()?.message, Toast.LENGTH_LONG).show()
                        startActivity(this@SignUpActivity.intent)
                    }

                    override fun onFailure(call: Call<DefaultResponse>, t: Throwable) {
                        Toast.makeText(applicationContext, t.message, Toast.LENGTH_LONG).show()
                    }
                }
                )


            val intent = Intent(this, HomeScreenActivity::class.java)

        }
    }

}