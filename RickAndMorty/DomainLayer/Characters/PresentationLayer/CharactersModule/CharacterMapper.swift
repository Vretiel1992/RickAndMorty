//
//  CharacterMapper.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

final class CharacterMapper: Mappable {

    func map(_ inputModel: CharacterModel) -> CharacterCollectionViewCell.Model {
        CharacterCollectionViewCell.Model(
            id: inputModel.id,
            characterName: inputModel.name,
            characterImageURL: inputModel.image
        )
    }
}
