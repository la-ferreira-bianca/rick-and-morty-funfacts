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
            List {
                ForEach(observed.characters.results) { character in
                    CharacterRow(character: .constant(character))
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
