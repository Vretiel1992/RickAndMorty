//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import Foundation

import Foundation

protocol NetworkManagerProtocol {

    func loadDataModel<T: Codable>(url: URL?, _ completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {

    // MARK: - Types

    enum Constants {

        // Error Strings

        static let noInternetConnection = "No internet connection"
        static let decode = "Data decoding error"
        static let unknown = "Unknown error"
    }

    enum FetchError: LocalizedError {
        case noInternetConnection
        case decode
        case unknown

        var errorDescription: String? {
            switch self {
            case .noInternetConnection:
                return Constants.noInternetConnection
            case .decode:
                return Constants.decode
            case .unknown:
                return Constants.unknown
            }
        }
    }

    // MARK: - Protocol Methods

    func loadDataModel<T: Codable>(url: URL?, _ completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                if error.isNoInternetConnection {
                    completion(.failure(FetchError.noInternetConnection))
                } else {
                    completion(.failure(FetchError.unknown))
                }
                return
            }
            guard let data = data else {
                completion(.failure(FetchError.unknown))
                return
            }
            do {
                let modelData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(modelData))
            } catch {
                completion(.failure(FetchError.decode))
            }
        }
        task.resume()
    }
}
