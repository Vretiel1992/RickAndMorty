//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 17.08.2023.
//

import UIKit

protocol CharactersViewProtocol: AnyObject {

    func update(with data: [CharacterCollectionViewCell.Model])
    func failure(error: String)
}

final class CharactersViewController: UIViewController {

    // MARK: - Types

    private enum Constants {

        // General

        static let title = "Characters"

        // Numerical

        static let defaultFlowLayoutSpacing: CGFloat = 16

        // Reuse Identifiers

        static let characterCellIdentifier = "characterCellIdentifier"
    }

    // MARK: - Public Properties

    var presenter: CharactersPresenterProtocol?

    // MARK: - Private Properties

    private var characters: [CharacterCollectionViewCell.Model] = []

    private let loadingView = LoadingView()

    private lazy var errorView: ErrorView = {
        let view = ErrorView()
        view.didTapUpdateViewButton = { [weak self] in
            guard let self = self else { return }
            self.loadingView.show()
            self.presenter?.didTapUpdateViewButton()
        }
        return view
    }()

    private let collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = Constants.defaultFlowLayoutSpacing
        layout.minimumLineSpacing = Constants.defaultFlowLayoutSpacing
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.backgroundColor = AppConstants.Colors.primaryBackgroundColor
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: AppConstants.Strings.defaultCellIdentifier
        )
        collectionView.register(
            CharacterCollectionViewCell.self,
            forCellWithReuseIdentifier: Constants.characterCellIdentifier
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupConstraints()
        loadingView.show()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Constants.title
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = AppConstants.Strings.empty
    }

    // MARK: - Private Methods

    private func setupNavigationBar() {
        navigationItem.backButtonTitle = AppConstants.Strings.empty
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = AppConstants.Colors.primaryBackgroundColor
        navBarAppearance.shadowImage = nil
        navBarAppearance.shadowColor = nil
        navBarAppearance.largeTitleTextAttributes = [
            .font: UIFont.setGilroyFont(weight: .bold, ofSize: 28),
            .foregroundColor: AppConstants.Colors.primaryTextColor
        ]
        navigationController?.navigationBar.tintColor = AppConstants.Colors.primaryTextColor
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }

    private func setupViews() {
        view.backgroundColor = AppConstants.Colors.primaryBackgroundColor
        view.addSubview(collectionView)
        view.addSubview(loadingView)
        view.addSubview(errorView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        errorView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            collectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),

            loadingView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            loadingView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            loadingView.widthAnchor.constraint(
                equalToConstant: 160
            ),

            errorView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 50
            ),
            errorView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -50
            ),
            errorView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
    }
}

// MARK: - CharactersViewProtocol

extension CharactersViewController: CharactersViewProtocol {

    func update(with data: [CharacterCollectionViewCell.Model]) {
        characters = data
        loadingView.hide()
        collectionView.reloadData()
        errorView.isHidden = true
        collectionView.isHidden = false
    }

    func failure(error: String) {
        errorView.updateErrorTextLabel(text: error)
        loadingView.hide()
        errorView.isHidden = false
        collectionView.isHidden = true
    }
}

// MARK: - UICollectionViewDataSource

extension CharactersViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.characterCellIdentifier,
            for: indexPath
        ) as? CharacterCollectionViewCell else {
            let item = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppConstants.Strings.defaultCellIdentifier,
                for: indexPath
            )
            return item
        }

        if indexPath.item < characters.count {
            let character = self.characters[indexPath.item]
            item.configure(with: character)
        }

        return item
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CharactersViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 2
        let leftSectionIndent: CGFloat = 20
        let rightSectionIndent: CGFloat = 27
        let width = floor(
            (collectionView.bounds.width - Constants.defaultFlowLayoutSpacing - leftSectionIndent - rightSectionIndent) / columns
        )
        let ratioFactor: CGFloat = 1.294
        let height = round(width * ratioFactor)
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 31, left: 20, bottom: 0, right: 27)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didTapCharacter(index: indexPath.row)
    }
}
