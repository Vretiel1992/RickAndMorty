//
//  DetailCharacterViewController.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import UIKit

protocol DetailCharacterViewProtocol: AnyObject {

    func update()
    func failure(error: String)
}

final class DetailCharacterViewController: UIViewController {

    // MARK: - Public Properties

    var presenter: DetailCharacterPresenterProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppConstants.Colors.primaryBackgroundColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false

    }
}

// MARK: - DetailCharacterViewProtocol

extension DetailCharacterViewController: DetailCharacterViewProtocol {

    func update() {

    }

    func failure(error: String) {

    }
}
