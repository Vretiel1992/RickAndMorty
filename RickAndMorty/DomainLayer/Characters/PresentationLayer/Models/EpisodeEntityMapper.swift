//
//  EpisodeEntityMapper.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

final class EpisodeEntityMapper: Mappable {

    func map(_ inputModel: EpisodeEntity) -> EpisodeModel {
        EpisodeModel(
            name: inputModel.name,
            airDate: inputModel.airDate,
            episode: inputModel.episode
        )
    }
}
