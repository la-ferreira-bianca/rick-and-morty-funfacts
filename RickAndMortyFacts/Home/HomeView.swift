//
//  HomeView.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var observed = Observed()
    @State private var pageURL = "https://rickandmortyapi.com/api/character"
    
    var body: some View {
        NavigationView {
            VStack {
                List(observed.characters.results, id: \.id) { character in
                    NavigationLink {
                        CharactersDetails(character: .constant(character))
                    } label: {
                        CharacterRow(
                            name: .constant(character.name),
                            iconURL: .constant(character.image)
                        )
                    }
                }
                HStack {
                    Button("Previous Page") {
                        guard let url = observed.characters.info.prev else { return }
                        pageURL = url
                        fetchCharacters(url: url)
                    }
                    
                    Button("Next Page") {
                        guard let url = observed.characters.info.next else { return }
                        pageURL = url
                        fetchCharacters(url: url)
                    }
                }
            }
            .onAppear {
                fetchCharacters(url: pageURL)
            }
        }
        
    }
    
    func fetchCharacters(url: String) {
        observed.fetchCharacters(url: url) { error in
            print(error?.localizedDescription ?? "")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
