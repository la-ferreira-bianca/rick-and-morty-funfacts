//
//  CharacterRow.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct CharacterRow: View {
    @Binding var name: String
    @Binding var iconURL: String
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: iconURL)) { image in
                image.image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 25, maxHeight: 25)
            }
            Text(name)
        }
        
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(
            name: .constant("Annie"),
            iconURL: .constant("https://rickandmortyapi.com/api/character/avatar/17.jpeg")
        )
    }
}
