//
//  Configurable.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

protocol Configurable {

    associatedtype Model

    func configure(with model: Model)
}
