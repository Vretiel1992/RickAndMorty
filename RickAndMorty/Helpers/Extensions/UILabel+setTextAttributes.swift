//
//  UILabel+setTextAttributes.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import Foundation

import UIKit

extension UILabel {
    func setTextAttributes(text: String, lineHeightMultiple: CGFloat, kern: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        let attributes: [NSAttributedString.Key: Any] = [
            .kern: kern,
            .paragraphStyle: paragraphStyle
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        attributedText = attributedString
    }
}
