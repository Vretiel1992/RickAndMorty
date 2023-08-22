//
//  DetailCharacterSectionHeaderView.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 22.08.2023.
//

import UIKit

final class DetailCharacterSectionHeaderView: UITableViewHeaderFooterView {

    // MARK: - Types

    private enum Constants {

        // Numerical

        static let defaultConstraintConstant: CGFloat = 24
    }
    
    // MARK: - Private Properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppConstants.Colors.secondaryTextColor
        label.font = UIFont.setGilroyFont(weight: .semibold, ofSize: 17)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override Methods

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }

    // MARK: - Private Methods

    private func setupViews() {
        backgroundColor = .clear
        addSubview(titleLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: Constants.defaultConstraintConstant
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Constants.defaultConstraintConstant
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -Constants.defaultConstraintConstant
            ),
            titleLabel.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            )
        ])
    }
}
