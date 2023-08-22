//
//  ErrorView.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import UIKit

final class ErrorView: UIView {

    // MARK: - Types

    private enum Constants {

        // General

        static let updateViewButtonText = "Update view"

        // Numerical

        static let defaultConstraintConstant: CGFloat = 16
    }

    // MARK: - Public Properties

    var didTapUpdateViewButton: (() -> Void)?

    // MARK: - Private Properties

    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var updateViewButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        let title = Constants.updateViewButtonText
        config.baseBackgroundColor = AppConstants.Colors.tertiaryBackgroundColor
        config.baseForegroundColor = AppConstants.Colors.primaryTextColor
        config.cornerStyle = .medium
        let attributeContainer = AttributeContainer([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ])
        config.attributedTitle = AttributedString(title, attributes: attributeContainer)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.didTapUpdateViewButton?()
        }), for: .touchUpInside)
        button.configuration = config
        return button
    }()

    private let errorTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppConstants.Colors.primaryTextColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func updateErrorTextLabel(text: String) {
        errorTextLabel.text = text
    }

    // MARK: - Private Methods

    private func setupViews() {
        backgroundColor = AppConstants.Colors.secondaryBackgroundColor
        layer.cornerRadius = 10
        isHidden = true
        addSubview(vStackView)
        vStackView.addArrangedSubview(errorTextLabel)
        vStackView.addArrangedSubview(updateViewButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: Constants.defaultConstraintConstant
            ),
            vStackView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Constants.defaultConstraintConstant
            ),
            vStackView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -Constants.defaultConstraintConstant
            ),
            vStackView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -Constants.defaultConstraintConstant
            ),

            updateViewButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
