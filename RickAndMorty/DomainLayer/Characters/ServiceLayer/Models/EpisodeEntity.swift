//
//  EpisodeEntity.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import Foundation

struct EpisodeEntity: Codable {

    let name: String
    let airDate: String
    let episode: String

    enum CodingKeys: String, CodingKey {

        case name
        case airDate = "air_date"
        case episode
    }
}
