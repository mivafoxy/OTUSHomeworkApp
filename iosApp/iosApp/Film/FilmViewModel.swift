//
//  FilmViewModel.swift
//  iosApp
//
//  Created by Илья Малахов on 03.05.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

@MainActor
final class FilmViewModel: ObservableObject {
    // MARK: - Types
    
    struct FilmModel {
        let title: String
        let episodeId: Int
        let openingCrawl: String
        let director: String
        let producer: String
        let releaseDate: String
        let species: [String]
        let starships: [String]
        let vehicles: [String]
        let characters: [String]
        let planets: [String]
        let url: String
        let created: String
        let edited: String
        
        init(film: Film) {
            title = film.title
            episodeId = Int(film.episode_id)
            openingCrawl = film.opening_crawl
            director = film.director
            producer = film.producer
            releaseDate = film.release_date
            species = film.species.compactMap { $0 as? String }
            starships = film.starships.compactMap { $0 as? String }
            vehicles = film.vehicles.compactMap { $0 as? String }
            characters = film.characters.compactMap { $0 as? String }
            planets = film.characters.compactMap { $0 as? String }
            url = film.url
            created = film.created
            edited = film.edited
        }
    }
    
    // MARK: - Properties
    
    private var ktorClient = KtorClient()
    private var urlString: String
    @Published private(set) var film: FilmModel?
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    // MARK: - Actions
    
    func fetch() async throws {
        let film = try await ktorClient.getFilm(urlString: urlString)
        self.film = FilmModel(film: film)
    }
}
