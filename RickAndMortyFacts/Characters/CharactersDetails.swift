//
//  CharactersDetails.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct CharactersDetails: View {
    @StateObject var observed = Observed()
    @Binding var character: Character
    
    var body: some View {
        ScrollView {
            Text(character.name)
                .font(.title)
                .font(.caption2)
            
            AsyncImage(url: URL(string: character.image))
                .cornerRadius(9)
                .overlay(RoundedRectangle(cornerRadius: 9)
                    .stroke(Color.white, lineWidth: 1)
                    .shadow(color: .black, radius: 3, x: 2, y: 2))
            
            HStack {
                Image(character.status == "Alive" ? "alive-icon" : "dead-icon")
                    .resizable()
                    .frame(width: 10, height: 10)
                Text(character.status)
                Text(character.type ?? "")
                
            }
            Text("Caracteristicas")
                .font(.title2)
            Text(character.species)
            Text(character.gender)
            
            HStack {
                Text("Local de Origin:")
                Text(character.origin.name)
            }
            
            HStack {
                Text("Localizacão Atual:")
                Text(character.location.name)
            }
            
            Text(character.created)
            
//            VStack {
//                Text("Episodios")
//                    .font(.headline)
//                if observed.isLoading {
//                    ProgressView()
//                } else {
//                    Text(observed.episode.name)
//                }
//            }
            
        }
        .task {
            await observed.fetchEpisodes(epURL: character.episode.first ?? "")
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
            origin: Location(
                name: "Earth",
                url: ""
            ),
            location: Location(
                name: "Earth",
                url: ""
            ),
            image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/28",
                "https://rickandmortyapi.com/api/episode/28"
            ],
            url: "",
            created: "2017-11-04T18:50:21.651Z"
        )))
    }
}
