//
//  Mappable.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

protocol Mappable {

    associatedtype InputModel
    associatedtype ResultModel

    func map(_ inputModel: InputModel) -> ResultModel
}

extension Mappable {

    func map(_ inputModels: [InputModel]) -> [ResultModel] {
        inputModels.map(map(_:))
    }
}
