//
//  UIFont+setGilroyFont.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import UIKit

extension UIFont {

    enum GilroyFontWeight: String {

        case medium = "Gilroy-Medium"
        case semibold = "Gilroy-Semibold"
        case bold = "Gilroy-Bold"
    }

    static func setGilroyFont(
        weight: GilroyFontWeight,
        ofSize fontSize: CGFloat
    ) -> UIFont {
        UIFont(name: weight.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}
