//
//  CaractersViewModel.swift
//  RickAndMortyFacts
//
//  Created by Bianca Ferreira on 25/07/23.
//
import Foundation
import SwiftUI

class CarectersViewModel: ObservableObject {
    @Published var results: [Character] = []
    
    func fetch() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            print(String(data: data, encoding: .utf8)!)
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(RickAndMortyResponse.self, from: data)
                DispatchQueue.main.async {
                    self.results = response.results
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    
    func getImage(_ image: String) -> URL? {
        guard let imageURL = URL(string: image) else {
            return nil
        }
        return imageURL
    }
}
