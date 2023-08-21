//
//  CharactersAPIManager.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import Foundation

protocol CharactersAPIManagerProtocol {

    func getCharacters(_ completion: @escaping (Result<RickAndMortyEntity, Error>) -> Void)
    func getLocation(
        url: URL?,
        _ completion: @escaping (Result<LocationEntity, Error>) -> Void
    )
    func getEpisode(
        url: URL?,
        _ completion: @escaping (Result<EpisodeEntity, Error>) -> Void
    )
}

final class CharactersAPIManager: CharactersAPIManagerProtocol {

    // MARK: - Private Properties

    private let networkManager: NetworkManagerProtocol

    // MARK: - Initializers

    required init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    // MARK: - Protocol Methods

    func getCharacters(_ completion: @escaping (Result<RickAndMortyEntity, Error>) -> Void) {
        networkManager.loadDataModel(url: url(for: "character")) { (result: Result<RickAndMortyEntity, Error>) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getLocation(
        url: URL?,
        _ completion: @escaping (Result<LocationEntity, Error>
        ) -> Void) {
        networkManager.loadDataModel(url: url) { (result: Result<LocationEntity, Error>) in
            switch result {
            case .success(let locationData):
                completion(.success(locationData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func getEpisode(
        url: URL?,
        _ completion: @escaping (Result<EpisodeEntity, Error>
        ) -> Void) {
        networkManager.loadDataModel(url: url) { (result: Result<EpisodeEntity, Error>) in
            switch result {
            case .success(let episodeData):
                completion(.success(episodeData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Private Methods

    private func url(for path: String) -> URL? {
        URL(string: "\(AppConstants.baseURL)\(path)")
    }
}
