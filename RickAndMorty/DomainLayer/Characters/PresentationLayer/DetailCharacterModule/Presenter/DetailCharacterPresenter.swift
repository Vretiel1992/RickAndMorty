//
//  DetailCharacterPresenter.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

protocol DetailCharacterPresenterProtocol: AnyObject {

    func viewDidLoad()
}

final class DetailCharacterPresenter: DetailCharacterPresenterProtocol {

    // MARK: - Private Properties

    private weak var view: DetailCharacterViewProtocol?
    private let characterAPIManager: CharactersAPIManagerProtocol
    private var character: CharacterModel
    private let detailCharacterHeaderViewMapper = DetailCharacterHeaderViewMapper()

    // MARK: - Initializers

    init(
        view: DetailCharacterViewProtocol,
        characterAPIManager: CharactersAPIManagerProtocol,
        character: CharacterModel
    ) {
        self.view = view
        self.characterAPIManager = characterAPIManager
        self.character = character
    }

    // MARK: - Protocol Methods

    func viewDidLoad() {
        view?.update(aboutCharacter: detailCharacterHeaderViewMapper.map(character))
    }
}
