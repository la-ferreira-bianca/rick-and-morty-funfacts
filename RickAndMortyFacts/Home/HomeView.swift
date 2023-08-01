//
//  HomeView.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var observed = Observed()
    var body: some View {
        VStack {
            List(observed.characters.results, id: \.id) { character in
                NavigationLink {
                    
                } label: {
                    CharacterRow(
                        name: .constant(character.name),
                        iconURL: .constant(character.image)
                    )
                }
            }
        }
        .onAppear {
            fetchCharacter()
        }
    }
    
    func fetchCharacter() {
        observed.fetchCharacters { error in
            print(error?.localizedDescription)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
