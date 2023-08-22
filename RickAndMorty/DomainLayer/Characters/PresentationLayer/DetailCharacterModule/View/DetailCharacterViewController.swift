//
//  DetailCharacterViewController.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import UIKit

protocol DetailCharacterViewProtocol: AnyObject {

    func update(
        aboutCharacter: DetailCharacterHeaderView.Model//,
    )
    func failure(error: String)
}

final class DetailCharacterViewController: UIViewController {

    // MARK: - Types

    private enum Constants {

        // Reuse Identifiers

        static let characterHeaderViewIdentifier = "characterHeaderViewIdentifier"
        static let characterSectionHeaderViewIdentifier = "characterSectionHeaderViewIdentifier"
    }

    // MARK: - Public Properties

    var presenter: DetailCharacterPresenterProtocol?

    // MARK: - Private Properties

    private var aboutCharacter: DetailCharacterHeaderView.Model?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: AppConstants.Strings.defaultCellIdentifier
        )
        tableView.register(
            DetailCharacterHeaderView.self,
            forHeaderFooterViewReuseIdentifier: Constants.characterHeaderViewIdentifier
        )
        tableView.register(
            DetailCharacterSectionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: Constants.characterSectionHeaderViewIdentifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false

    }

    // MARK: - Private Methods

    func setupView() {
        view.backgroundColor = AppConstants.Colors.primaryBackgroundColor
        view.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }
}

// MARK: - DetailCharacterViewProtocol

extension DetailCharacterViewController: DetailCharacterViewProtocol {

    func update(aboutCharacter: DetailCharacterHeaderView.Model) {
        self.aboutCharacter = aboutCharacter
        tableView.reloadData()
    }

    func failure(error: String) {
        print(error)
    }
}

// MARK: - UITableViewDataSource

extension DetailCharacterViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension DetailCharacterViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            guard let view = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: Constants.characterHeaderViewIdentifier
            ) as? DetailCharacterHeaderView else { return nil }
            if let aboutCharacter = aboutCharacter {
                view.configure(with: aboutCharacter)
            }
            return view
        case 1:
            guard let view = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: Constants.characterSectionHeaderViewIdentifier
            ) as? DetailCharacterSectionHeaderView else { return nil }

            return view
        default:
            return nil
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
