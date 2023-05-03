//
//  AllFilmsView.swift
//  iosApp
//
//  Created by Илья Малахов on 03.05.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct AllFilmsView: View {
    @ObservedObject private var viewModel = AllFilmsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.model.items, id: \.self) { modelItem in
                    NavigationLink(modelItem.title) {
                        FilmView(urlString: modelItem.url)
                    }
                }
            }
        }
        .navigationTitle("Фильмы")
        .onAppear {
            Task {
                try await viewModel.fetchFilms()
            }
        }
    }
}

struct AllFilmsView_Previews: PreviewProvider {
    static var previews: some View {
        AllFilmsView()
    }
}
