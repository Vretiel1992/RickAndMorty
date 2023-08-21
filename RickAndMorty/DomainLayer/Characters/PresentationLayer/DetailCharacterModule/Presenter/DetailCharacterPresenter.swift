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

    // MARK: - Initializers

    init(
        view: DetailCharacterViewProtocol,
        characterAPIManager: CharactersAPIManagerProtocol
    ) {
        self.view = view
        self.characterAPIManager = characterAPIManager
    }

    // MARK: - Protocol Methods

    func viewDidLoad() {

    }
}
