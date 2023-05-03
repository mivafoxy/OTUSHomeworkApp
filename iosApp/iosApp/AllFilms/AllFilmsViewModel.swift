//
//  AllFilmsViewModel.swift
//  iosApp
//
//  Created by Илья Малахов on 03.05.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

@MainActor
final class AllFilmsViewModel: ObservableObject {
    // MARK: - Types
    
    struct Model {
        var items = [Film]()
        var hasNextPage = true
        var currentPage = 1
    }
    
    // MARK: - Properties
    
    private let ktorClient = KtorClient()
    @Published private(set) var model: Model = Model()
    
    // MARK: -  Actions
    
    func fetchFilms() async throws {
        let films = try await ktorClient.getFilms(pageNumber: Int32(model.currentPage), sectionName: "films")
        if let results = films.results?.compactMap( { $0 as? Film } ) {
            model.items.append(contentsOf: results)
        }
        model.hasNextPage = films.next != nil
        model.currentPage += 1
    }
}
