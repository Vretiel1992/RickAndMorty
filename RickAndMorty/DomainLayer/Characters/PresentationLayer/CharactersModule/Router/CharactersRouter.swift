//
//  CharactersRouter.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

protocol CharactersRouterProtocol {
    func openDetailCharacter(_ character: CharacterModel)
}

final class CharactersRouter: CharactersRouterProtocol {

    // MARK: - Private Properties

    private weak var view: Presentable?
    private let assembly: AssemblyProtocol

    // MARK: - Initializers

    init(
        view: Presentable,
        assembly: AssemblyProtocol
    ) {
        self.view = view
        self.assembly = assembly
    }

    // MARK: - Protocol Methods

    func openDetailCharacter(_ character: CharacterModel) {
        let presentable = assembly.createDetailCharacterModule(
            character: character
        )

        view?.navigationController?.pushViewController(presentable, animated: true)
    }
}
