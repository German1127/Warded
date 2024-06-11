package com.example.untitle

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import com.pusher.client.Pusher
import com.pusher.client.PusherOptions
import com.pusher.client.connection.ConnectionEventListener
import com.pusher.client.connection.ConnectionState
import com.pusher.client.connection.ConnectionStateChange

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

    val options = PusherOptions()
    options.setCluster("sa1");

    val pusher = Pusher("5b8f0f4f83ccef5cb795", options)

    pusher.connect(object : ConnectionEventListener {
        override fun onConnectionStateChange(change: ConnectionStateChange) {
            Log.i("Pusher", "State changed from ${change.previousState} to ${change.currentState}")
        }

        override fun onError(
            message: String,
            code: String,
            e: Exception
        ) {
            Log.i("Pusher", "There was a problem connecting! code ($code), message ($message), exception($e)")
        }
    }, ConnectionState.ALL)

    val channel = pusher.subscribe("my-channel")
    channel.bind("my-event") { event ->
        Log.i("Pusher","Received event with data: $event")
    }
  }
}
