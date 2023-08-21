//
//  CharacterEntity.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import Foundation

struct CharacterEntity: Codable {

    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: OriginEntity
    let image: URL
    let episode: [String]
}
