package com.example.getfit

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.getfit.databinding.ActivityHistoryBinding
import com.example.getfit.databinding.ActivityLeaderBoardBinding

class HistoryActivity : AppCompatActivity() {

    private lateinit var binding: ActivityHistoryBinding

    override fun onCreate(savedInstanceState: Bundle?) {

        binding = ActivityHistoryBinding.inflate(layoutInflater)

        super.onCreate(savedInstanceState)
        setContentView(binding.root)

     /*   binding.btnFriends5.setOnClickListener {
            startActivity(Intent(this, LeaderBoardActivity::class.java))
        }

        binding.btnGoals5.setOnClickListener {
            startActivity(Intent(this, GoalsActivity::class.java))
        }

        binding.btnSports5.setOnClickListener {
            startActivity(Intent(this, HistoryActivity::class.java))
        }

        binding.btnHome5.setOnClickListener {
            startActivity(Intent(this, HomeScreenActivity::class.java))
        }*/
    }
}