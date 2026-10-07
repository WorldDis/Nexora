package com.nexora.accessibility

import android.accessibilityservice.AccessibilityService
import android.view.accessibility.AccessibilityEvent
import android.util.Log

class NexoraAccessibilityService : AccessibilityService() {

    override fun onServiceConnected() {
        super.onServiceConnected()

        Log.d(
            "NEXORA",
            "Accessibility Service Connected"
        )
    }

    override fun onAccessibilityEvent(
        event: AccessibilityEvent?
    ) {
        if (event == null) return

        val packageName =
            event.packageName?.toString() ?: "unknown"

        Log.d(
            "NEXORA",
            "App: $packageName | Event: ${event.eventType}"
        )
    }

    override fun onInterrupt() {

        Log.d(
            "NEXORA",
            "Accessibility Service Interrupted"
        )
    }
}