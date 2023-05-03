package com.example.otushomeworkapp.network

import com.example.otushomeworkapp.model.Film
import com.example.otushomeworkapp.model.Films
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.plugins.HttpTimeout
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.timeout
import io.ktor.client.request.get
import io.ktor.client.request.parameter
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json

class KtorClient {
    private val baseUrl = "https://swapi.dev/api/"

    val client = HttpClient {
        install(ContentNegotiation) {
            json(
                Json {
                    prettyPrint
                    ignoreUnknownKeys
                }
            )
        }
        install(HttpTimeout )
    }

    suspend fun getFilms(pageNumber: Int, sectionName: String): Films {
        return client.get(urlString = "$baseUrl/$sectionName/?page=$pageNumber").body()
    }

    suspend fun getFilm(urlString: String): Film {
        return client.get(urlString = urlString).body()
    }
}