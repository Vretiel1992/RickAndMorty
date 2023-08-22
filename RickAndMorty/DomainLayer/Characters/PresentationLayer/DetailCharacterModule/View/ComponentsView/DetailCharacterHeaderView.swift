//
//  DetailCharacterHeaderView.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import UIKit

final class DetailCharacterHeaderView: UITableViewHeaderFooterView {

    // MARK: - Private Properties

    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppConstants.Colors.primaryTextColor
        label.font = UIFont.setGilroyFont(weight: .bold, ofSize: 22)
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        return label
    }()

    private let characterStatusLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppConstants.Colors.tertiaryTextColor
        label.font = UIFont.setGilroyFont(weight: .medium, ofSize: 16)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
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

    // MARK: - Private Methods

    func setupViews() {
        backgroundColor = .clear
        addSubview(vStackView)
        vStackView.addArrangedSubview(characterImageView)
        vStackView.addArrangedSubview(characterNameLabel)
        vStackView.addArrangedSubview(characterStatusLabel)
        vStackView.setCustomSpacing(24, after: characterImageView)
        vStackView.setCustomSpacing(8, after: characterNameLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 16
            ),
            vStackView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor
            ),
            vStackView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor
            ),
            vStackView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            ),

            characterImageView.widthAnchor.constraint(
                equalToConstant: 148
            ),
            characterImageView.heightAnchor.constraint(
                equalTo: characterImageView.widthAnchor,
                multiplier: 1.0
            )
        ])
    }
}

// MARK: - Configurable

extension DetailCharacterHeaderView: Configurable {

    struct Model {

        let characterImageURL: URL?
        let characterName: String
        let characterStatus: String
    }

    func configure(with model: Model) {
        if let url = model.characterImageURL {
            characterImageView.setImageURL(url)
        }

        characterNameLabel.setTextAttributes(
            text: model.characterName,
            lineHeightMultiple: 0.94,
            kern: 0.32
        )

        characterStatusLabel.setTextAttributes(
            text: model.characterStatus,
            lineHeightMultiple: 1.06,
            kern: -0.32
        )
    }
}
