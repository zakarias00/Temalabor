package com.example.getfit

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.getfit.databinding.ActivityHomeScreenBinding
import com.example.getfit.databinding.ActivityLeaderBoardBinding

class LeaderBoardActivity : AppCompatActivity() {

    private lateinit var binding: ActivityLeaderBoardBinding

    override fun onCreate(savedInstanceState: Bundle?) {

        binding = ActivityLeaderBoardBinding.inflate(layoutInflater)

        super.onCreate(savedInstanceState)
        setContentView(binding.root)

      /*  binding.btnFriends3.setOnClickListener {
            startActivity(Intent(this, LeaderBoardActivity::class.java))
        }

        binding.btnGoals3.setOnClickListener {
            startActivity(Intent(this, GoalsActivity::class.java))
        }

        binding.btnSports3.setOnClickListener {
            startActivity(Intent(this, HistoryActivity::class.java))
        }

        binding.btnHome3.setOnClickListener {
            startActivity(Intent(this, HomeScreenActivity::class.java))
        }*/
    }
}