//
//  CharactersPresenter.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import Foundation

protocol CharactersPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didTapUpdateViewButton()
    func didTapCharacter(index: Int)
}

final class CharactersPresenter: CharactersPresenterProtocol {

    // MARK: - Private Properties

    private weak var view: CharactersViewProtocol?
    private let characterAPIManager: CharactersAPIManagerProtocol
    private let router: CharactersRouterProtocol

    private let characterEntityMapper = CharacterEntityMapper()
    private let characterMapper = CharacterMapper()
    private var characters: [CharacterModel] = [] {
        didSet {
            view?.update(with: characters.map(characterMapper.map))
        }
    }

    // MARK: - Initializers

    init(
        view: CharactersViewProtocol,
        characterAPIManager: CharactersAPIManagerProtocol,
        router: CharactersRouterProtocol
    ) {
        self.view = view
        self.characterAPIManager = characterAPIManager
        self.router = router
    }

    // MARK: - Protocol Methods

    func viewDidLoad() {
        getCharactersData()
    }

    func didTapUpdateViewButton() {
        viewDidLoad()
    }

    func didTapCharacter(index: Int) {
        guard index < characters.count else { return }
        let character = characters[index]
        router.openDetailCharacter(character)
    }

    // MARK: - Private Methods

    private func getCharactersData() {
        characterAPIManager.getCharacters { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let charactersData):
                    self.characters = self.characterEntityMapper.map(charactersData.results)
                case .failure(let error):
                    self.view?.failure(error: error.localizedDescription)
                }
            }
        }
    }
}
