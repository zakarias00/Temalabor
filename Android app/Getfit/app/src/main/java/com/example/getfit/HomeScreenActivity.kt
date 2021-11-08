package com.example.getfit

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.FrameLayout
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentTransaction
import com.example.getfit.databinding.ActivityHomeScreenBinding
import com.example.getfit.fragments.GoalsFragment
import com.example.getfit.fragments.HistoryFragment
import com.example.getfit.fragments.HomeFragment
import com.example.getfit.fragments.LeaderBoardFragment
import com.google.android.material.bottomnavigation.BottomNavigationView

class HomeScreenActivity : AppCompatActivity() {

    private lateinit var binding: ActivityHomeScreenBinding

    private val homeFragment = HomeFragment()
    private val historyFragment = HistoryFragment()
    private val leaderBoardFragment = LeaderBoardFragment()
    private val goalsFragment = GoalsFragment()


    override fun onCreate(savedInstanceState: Bundle?) {

       //  binding = ActivityHomeScreenBinding.inflate(layoutInflater)

        var bottomNavigation:BottomNavigationView = findViewById<BottomNavigationView>(R.id.bottomNavigation)
        var frame = findViewById<FrameLayout>(R.id.fragment_container)

        supportFragmentManager
            .beginTransaction()
            .replace(R.id.fragment_container, homeFragment)
            .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
            .commit()

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_home_screen)
        replaceFragment(homeFragment)

        bottomNavigation.setOnItemSelectedListener{
           item->
            when(item.itemId){
                R.id.ic_home ->{
                    supportFragmentManager
                        .beginTransaction()
                        .replace(R.id.fragment_container, homeFragment)
                        .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
                        .commit()
                }

                R.id.ic_goals ->{
                    supportFragmentManager
                        .beginTransaction()
                        .replace(R.id.fragment_container, goalsFragment)
                        .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
                        .commit()
                }


                R.id.ic_history ->{
                    supportFragmentManager
                        .beginTransaction()
                        .replace(R.id.fragment_container, historyFragment)
                        .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
                        .commit()
                }


                R.id.ic_leaderboard ->{
                    supportFragmentManager
                        .beginTransaction()
                        .replace(R.id.fragment_container, leaderBoardFragment)
                        .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
                        .commit()
                }
            }

            true
        }



      //  BottomNavigationView() bottomNavigationView = findViewById(R.id.bottom_navigation)


    }

    private fun replaceFragment(fragment: Fragment){
        if(fragment!=null){
            val transaction = supportFragmentManager.beginTransaction()
            transaction.replace(R.id.fragment_container, fragment)
            transaction.commit()
        }

    }


}