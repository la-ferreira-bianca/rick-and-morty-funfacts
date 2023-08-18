//
//  CharacterDetails+Observed.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 18/08/23.
//

import Foundation

extension CharactersDetails {
    //MARK: - Observed
    class Observed: ObservableObject {
        @Published var episode = Episode()
        //TODO: see why this published its getting error
        @Published var isLoading: Bool = false
        
        @MainActor func fetchEpisodes(epURL: String) async {
            isLoading.toggle()
            guard let url = URL(string: epURL) else { return }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(Episode.self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.episode = response
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
