//
//  HomeView.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var observed = Observed()
    @State var selectedPage = 1
    
    private let addaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Rick And Morty Fucking Fun Facts")
                    .font(.title2)
                    .padding(.top)
                
                TabView(selection: $selectedPage) {
                    ForEach(1..<43) { item in
                        CarrosellView(page: item)
                            .tag(item)
                    }
                }
                .tabViewStyle(.page)
            }
            
        }
        
    }
    
    @ViewBuilder
    func CarrosellView(page: Int) -> some View {
        VStack {
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
        .onAppear {
            observed.fetchCharacters(pageNumber: selectedPage) { error in
                print("\(error)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
