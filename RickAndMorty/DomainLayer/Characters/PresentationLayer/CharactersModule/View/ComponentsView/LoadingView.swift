//
//  LoadingView.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import UIKit

final class LoadingView: UIView {

    // MARK: - Types

    private enum Constants {

        // General

        static let infoLabelText = "Loading..."

        // Numerical

        static let defaultConstraintConstant: CGFloat = 16
    }

    // MARK: - Private Properties

    private let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        return indicator
    }()

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = Constants.infoLabelText
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
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

    func show() {
        isHidden.toggle()
        activityIndicator.startAnimating()
    }

    func hide() {
        isHidden.toggle()
        activityIndicator.stopAnimating()
    }

    // MARK: - Private Methods

    private func setupViews() {
        backgroundColor = AppConstants.Colors.secondaryBackgroundColor
        layer.cornerRadius = 10
        isHidden = true
        addSubview(vStackView)
        vStackView.addArrangedSubview(activityIndicator)
        vStackView.addArrangedSubview(infoLabel)
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
            )
        ])
    }
}
