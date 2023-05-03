package com.example.otushomeworkapp.model

import kotlinx.serialization.Serializable

@Serializable
data class Films(
    val count: Int?,
    val next: String?,
    val previous: String?,
    var results: ArrayList<Film>?
)