package com.example.getfit

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.getfit.databinding.ActivityGoalsBinding
import com.example.getfit.databinding.ActivityLeaderBoardBinding

class GoalsActivity : AppCompatActivity() {

    private lateinit var binding: ActivityGoalsBinding

    override fun onCreate(savedInstanceState: Bundle?) {

        binding = ActivityGoalsBinding.inflate(layoutInflater)

        super.onCreate(savedInstanceState)
        setContentView(binding.root)

     /*   binding.btnFriends6.setOnClickListener {
            startActivity(Intent(this, LeaderBoardActivity::class.java))
        }

        binding.btnGoals6.setOnClickListener {
            startActivity(Intent(this, GoalsActivity::class.java))
        }

        binding.btnSports6.setOnClickListener {
            startActivity(Intent(this, HistoryActivity::class.java))
        }

        binding.btnHome6.setOnClickListener {
            startActivity(Intent(this, HomeScreenActivity::class.java))
        }*/
    }
}