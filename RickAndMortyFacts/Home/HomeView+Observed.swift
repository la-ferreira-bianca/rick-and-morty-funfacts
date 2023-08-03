//
//  HomeView+Observed.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

extension HomeView {
    //MARK: - Observed
    class Observed: ObservableObject {
        @Published var characters = Characters()
        //TODO: see why this published its getting error
        @Published var isLoading: Bool = false
        
        //MARK: - Observed fuctions
        @MainActor func fetchCharacters(pageNumber: Int) async {
            isLoading.toggle()
            guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(pageNumber)") else { return }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(Characters.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.characters = response
                    self.isLoading.toggle()
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading.toggle()
                    print("Error decoding JSON: \(error)")
                }
            }
        }
    }
    
    
}
