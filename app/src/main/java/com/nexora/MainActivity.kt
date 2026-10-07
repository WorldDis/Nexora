package com.nexora

import android.content.Intent
import android.os.Bundle
import android.provider.Settings
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val layout = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(32, 64, 32, 32)
        }

        val title = TextView(this).apply {
            text = "NEXORA"
            textSize = 32f
        }

        val subtitle = TextView(this).apply {
            text = "AI Accessibility & Action Agent"
            textSize = 18f
        }

        val accessibilityButton = Button(this).apply {
            text = "Enable Accessibility"

            setOnClickListener {
                startActivity(
                    Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)
                )
            }
        }

        layout.addView(title)
        layout.addView(subtitle)
        layout.addView(accessibilityButton)

        setContentView(layout)
    }
}