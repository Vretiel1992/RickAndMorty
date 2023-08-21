//
//  LocationEntityMapper.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

final class LocationEntityMapper: Mappable {

    func map(_ inputModel: LocationEntity) -> LocationModel {
        LocationModel(
            name: inputModel.name,
            type: inputModel.type
        )
    }
}
