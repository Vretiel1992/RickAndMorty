//
//  Error+isNoInternetConnection.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import Foundation

extension Error {

    var isNoInternetConnection: Bool {
        switch (self as NSError).code {
        case URLError.Code.notConnectedToInternet.rawValue,
            URLError.Code.networkConnectionLost.rawValue:
            return true
        default:
            return false
        }
    }
}
