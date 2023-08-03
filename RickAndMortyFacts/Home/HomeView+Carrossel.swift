//
//  HomeView+Carrossel.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 03/08/23.
//
import SwiftUI

extension HomeView {
    @ViewBuilder
    @MainActor func CarrosellView(page: Int) -> some View {
        VStack {
            if observed.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: addaptiveColumns, spacing: 20) {
                        ForEach(observed.characters.results, id: \.id) { character in
                            NavigationLink {
                                CharactersDetails(character: .constant(character))
                            } label: {
                                CharacterRow(
                                    name: .constant(character.name),
                                    iconURL: .constant(character.image)
                                )
                                .frame(width: 170, height: 170)
                            }
                        }
                    }
                }
            }
        }
        .task {
            await observed.fetchCharacters(pageNumber: page)
        }
    }
}
