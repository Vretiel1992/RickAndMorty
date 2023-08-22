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

        // Colors view

        static let primaryBackgroundColor = UIColor(hexString: "#040C1E")
        static let secondaryBackgroundColor = UIColor(hexString: "#262A38")
        static let tertiaryBackgroundColor = UIColor(hexString: "#191C2A")

        // Colors text

        static let primaryTextColor = UIColor.white
        static let secondaryTextColor = UIColor(hexString: "#C4C9CE")
        static let tertiaryTextColor = UIColor(hexString: "#47C60B")
        static let quaternaryTextColor = UIColor(hexString: "#93989C")
    }

    enum Strings {

        // General

        static let empty = ""

        // Reuse Identifiers

        static let defaultCellIdentifier = "defaultCellIdentifier"
    }
}
