//
//  CharacterEntityMapper.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

final class CharacterEntityMapper: Mappable {

    func map(_ inputModel: CharacterEntity) -> CharacterModel {
        CharacterModel(
            id: inputModel.id,
            name: inputModel.name,
            status: inputModel.status,
            species: inputModel.species,
            type: inputModel.type,
            gender: inputModel.gender,
            origin: inputModel.origin.url,
            episode: inputModel.episode,
            image: inputModel.image
        )
    }
}
