package com.example.otushomeworkapp

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform