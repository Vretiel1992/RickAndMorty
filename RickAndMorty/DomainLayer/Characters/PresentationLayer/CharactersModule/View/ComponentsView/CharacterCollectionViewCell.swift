//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import UIKit

final class CharacterCollectionViewCell: UICollectionViewCell {

    // MARK: - Types

    private enum Constants {

        // Numerical

        static let defaultConstraintConstant: CGFloat = 8
    }

    // MARK: - Private Properties

    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.setGilroyFont(weight: .semibold, ofSize: 17)
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override Methods

    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        characterNameLabel.text = nil
    }

    // MARK: - Private Methods

    private func setupViews() {
        contentView.backgroundColor = AppConstants.Colors.secondaryBackgroundColor
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true
        contentView.addSubview(vStackView)
        vStackView.addArrangedSubview(characterImageView)
        vStackView.addArrangedSubview(characterNameLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.defaultConstraintConstant
            ),
            vStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.defaultConstraintConstant
            ),
            vStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.defaultConstraintConstant
            ),
            vStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constants.defaultConstraintConstant * 2
            ),

            characterImageView.heightAnchor.constraint(
                equalTo: characterImageView.widthAnchor,
                multiplier: 1.0
            )
        ])
    }
}

// MARK: - Configurable

extension CharacterCollectionViewCell: Configurable {

    struct Model {
        let id: Int
        let characterName: String
        let characterImageURL: URL?
    }

    func configure(with model: Model) {
        characterNameLabel.setTextAttributes(
            text: model.characterName,
            lineHeightMultiple: 1.08,
            kern: -0.41
        )

        if let url = model.characterImageURL {
            characterImageView.setImageURL(url)
        }
    }
}
