//
//  DetailCharacterHeaderViewMapper.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 22.08.2023.
//

import Foundation

final class DetailCharacterHeaderViewMapper: Mappable {

    func map(_ inputModel: CharacterModel) -> DetailCharacterHeaderView.Model {
        DetailCharacterHeaderView.Model(
            characterImageURL: inputModel.image,
            characterName: inputModel.name,
            characterStatus: inputModel.status
        )
    }
}
