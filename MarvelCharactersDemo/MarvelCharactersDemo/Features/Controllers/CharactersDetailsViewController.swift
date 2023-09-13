//
//  CharactersDetailsViewController.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import Kingfisher
import UIKit

class CharactersDetailsViewController: BaseViewController {
    // MARK: - Outlets

    @IBOutlet var characterImageView: UIImageView!

    // MARK: - Properties

    lazy var viewModel = CharactersDetailsViewModel(outputStatus: outputStatus, inputStatus: inputStatus)
    var character: CharacterModel?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Internal Methods

    private func setupInterface() {
        if let urlSafe = URL(string: "\(character?.thumbnail?.path ?? "").\(character?.thumbnail?.ext ?? "")") {
            characterImageView.kf.setImage(with: urlSafe)
        }
    }

    private func setupTableView() {
    }
}
