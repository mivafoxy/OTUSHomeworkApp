//
//  FilmView.swift
//  iosApp
//
//  Created by Илья Малахов on 03.05.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct FilmView: View {
    @ObservedObject private var viewModel: FilmViewModel
    
    init(urlString: String) {
        viewModel = FilmViewModel(urlString: urlString)
    }
    
    var body: some View {
        mainBody
    }
    
    var mainBody: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Text("Название: \(viewModel.film?.title ?? "")")
                    Text("Номер эпизода: \(viewModel.film?.episodeId ?? -1)")
                    Text("Текст субтритров: \(viewModel.film?.openingCrawl ?? "")")
                    Text("Режиссер: \(viewModel.film?.director ?? "")")
                    Text("Продюсер: \(viewModel.film?.producer ?? "")")
                    Text("Дата выхода: \(viewModel.film?.releaseDate ?? "")")
                }
                
                Group {
                    Text("Создан: \(viewModel.film?.created ?? "")")
                    Text("Обновлен:  \(viewModel.film?.edited ?? "")")
                }
            }
        }
        .onAppear {
            Task {
                try await viewModel.fetch()
            }
        }
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
