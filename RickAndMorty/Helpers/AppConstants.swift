//
//  AppConstants.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import UIKit

enum AppConstants {

    static let baseURL = "https://rickandmortyapi.com/api/"

    enum Colors {
        static let primaryBackgroundColor = UIColor(hexString: "#040C1E")
        static let secondaryBackgroundColor = UIColor(hexString: "#262A38")
        static let tertiaryBackgroundColor = UIColor(hexString: "#191C2A")
    }

    enum Strings {

        // General

        static let empty = ""

        // Reuse Identifiers

        static let defaultCellIdentifier = "defaultCellIdentifier"
    }
}
