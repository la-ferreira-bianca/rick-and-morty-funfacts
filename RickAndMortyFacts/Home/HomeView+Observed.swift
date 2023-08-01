//
//  HomeView+Observed.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

extension HomeView {
    class Observed: ObservableObject {
        @Published var characters = Characters()
        
        func fetchCharacters(completion: (Error?) -> ()) {
            guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                print(String(data: data, encoding: .utf8)!)
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Characters.self, from: data)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.characters = response
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            task.resume()
        }
    }
}

