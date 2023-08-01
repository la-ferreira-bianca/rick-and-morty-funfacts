//
//  Characters.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 01/08/23.
//

import SwiftUI

struct Characters: Codable {
    let info: Info
    let results: [Character]
    
    init(info: Info? = nil, results: [Character]? = nil) {
        self.info = info ?? .init(count: 0, pages: 0, next: nil, prev: nil)
        self.results = results ?? []
    }
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}
