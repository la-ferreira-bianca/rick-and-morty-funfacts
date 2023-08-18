//
//  Episodes.swift
//  RickAndMortyFunFacts
//
//  Created by Bianca Ferreira on 18/08/23.
//

import SwiftUI

struct Episode: Identifiable, Codable {
    var id: Int
    var name: String
    var airDate: String
    var episodeCode: String
    var characters: [String]
    var url: String
    var created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, airDate = "air_date", episodeCode = "episode", characters, url, created
    }
    
    init(id: Int? = nil, name: String? = nil, airDate: String? = nil, episodeCode: String? = nil, characters: [String]? = nil, url: String? = nil, created: String? = nil) {
        self.id = id ?? 0
        self.name = name ?? ""
        self.airDate = airDate ?? ""
        self.episodeCode = episodeCode ?? ""
        self.characters = characters ?? []
        self.url = url ?? ""
        self.created = created ?? ""
    }
}
