//
//  CharactersDetails.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct CharactersDetails: View {
    @Binding var character: Character
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image))
            
            
            HStack {
                Text(character.name)
                    .font(.title)
                
                Image(character.status == "Alive" ? "alive-icon" : "dead-icon")
                    .resizable()
                    .frame(width: 10, height: 10)
                Text(character.status)
            }
            
            Text(character.species)
            Text(character.gender)
            Text(character.created)
        }
    }
}

struct CharactersDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharactersDetails(character: .constant(Character(
            id: 2,
            name: "Morty Smith",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: Location(name: "Earth", url: ""),
            location: Location(name: "Earth", url: ""),
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            episode: [""],
            url: "",
            created: "2017-11-04T18:50:21.651Z")))
    }
}
