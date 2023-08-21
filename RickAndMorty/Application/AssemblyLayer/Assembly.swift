//
//  Assembly.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import UIKit

typealias Presentable = UIViewController

protocol AssemblyProtocol {

    func createCharactersModule() -> Presentable
    func createDetailCharacterModule(character: CharacterModel) -> Presentable
}

final class Assembly: AssemblyProtocol {

    // MARK: - Private Properties

    private let networkManager: NetworkManagerProtocol
    private let charactersAPIManager: CharactersAPIManagerProtocol

    // MARK: - Initializers

    init() {
        self.networkManager = NetworkManager()
        self.charactersAPIManager = CharactersAPIManager(networkManager: networkManager)
    }

    // MARK: - Protocol Methods

    func createCharactersModule() -> Presentable {
        let view = CharactersViewController()
        let router = CharactersRouter(view: view, assembly: self)
        let presenter = CharactersPresenter(
            view: view,
            characterAPIManager: charactersAPIManager,
            router: router
        )
        view.presenter = presenter
        return view
    }

    func createDetailCharacterModule(character: CharacterModel) -> Presentable {
        let view = DetailCharacterViewController()
        let presenter = DetailCharacterPresenter(
            view: view,
            characterAPIManager: charactersAPIManager
        )
        view.presenter = presenter
        return view
    }
}
