package com.example.getfit

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import api.RetrofitClient
import com.example.getfit.databinding.ActivityLoginBinding
import data.LoginResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityLoginBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnSingUp.setOnClickListener{
            val intent = Intent(this, SignUpActivity::class.java)
            startActivity(intent)
        }

        binding.btnLogin.setOnClickListener{

            val email= binding.editTextEmailAddress.text.toString().trim()
            val password = binding.editTexPassword.text.toString().trim()

            if(email.isEmpty()){
                binding.editTextEmailAddress.error = "Email is required!"
                binding.editTexPassword.requestFocus()
                return@setOnClickListener
            }

            if(password.isEmpty()){
                binding.editTexPassword.error = "Password is required!"
                binding.editTexPassword.requestFocus()
                return@setOnClickListener
            }

            RetrofitClient.instance.userLogin(email, password)
                .enqueue(object :Callback<LoginResponse> {
                    override fun onFailure(call: Call<LoginResponse>, t: Throwable) {
                        Toast.makeText(applicationContext, t.message, Toast.LENGTH_LONG).show()
                    }

                    override fun onResponse(
                        call: Call<LoginResponse>,
                        response: Response<LoginResponse>
                    ) {
                        if (!response.body()?.error!!) {
                            //lehet hogy itt meg letre kene hozni es eltarolni a usereket
                            startActivity(this@MainActivity.intent)

                        } else {
                            Toast.makeText(
                                applicationContext,
                                response.body()?.message,
                                Toast.LENGTH_LONG
                            ).show()
                        }
                    }
                })

            //val intent = Intent(this, HomeScreenActivity::class.java)
        }
    }
}