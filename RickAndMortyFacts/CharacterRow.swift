//
//  CharacterRow.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct CharacterRow: View {
    @Binding var character: Character
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 25, maxHeight: 25)
            }
            Text(character.name)
        }
        
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: .constant(Character(
            id: 17,
            name: "Annie",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Female",
            origin: Location(name: "Earth", url: ""),
            location: Location(name: "Anatomy Park", url: ""),
            image: "https://rickandmortyapi.com/api/character/avatar/17.jpeg",
            episode: [""],
            url: "",
            created: "")))
    }
}
