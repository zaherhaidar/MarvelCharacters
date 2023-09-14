//
//  CharactersListViewController.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Combine
import UIKit

class CharactersListViewController: BaseViewController {
    // MARK: - Outlets

    @IBOutlet var tableView: UITableView!

    // MARK: - Properties

    lazy var viewModel = CharactersListViewModel(outputStatus: outputStatus, inputStatus: inputStatus)
    var isLoading: Bool = true
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isLoading = true
        self.fetchData()
    }

    // MARK: - Internal Methods

    override func setupHeaderView() {
        super.setupHeaderView()
        headerView?.imageTitle = UIImage(named: "marvelLogo")
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterTableViewCell")

        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func fetchDataResponse(response: Any?, error: Error?, apiName: Any?) {
        if let _ = error {
            // show error
        } else {
            if let characters = response as? [CharacterModel] {
                isLoading = false
                characters.count > 0 ? tableView.reloadData() : nil
            }
        }
    }
}

extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isLoading ? 5 : viewModel.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let item = viewModel.item(at: indexPath.row)
        cell.setupCell(name: item?.name, thumbnail: item?.thumbnail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.setTemplateWithSubviews(isLoading, animate: true, viewBackgroundColor: .systemBackground)
        
        // This piece of code if i want to pagination
        
//        let displayedCount = viewModel.numberOfItems
//        if indexPath.row + 1 == (displayedCount - 10) {
//            if displayedCount < self.viewModel.totalDataCount {
//                self.viewModel.isPagination = true
//                self.viewModel.pageIndex += 1
//                fetchData()
//            }
//        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToCharacterDetailScreen(idx: indexPath.row)
    }
}
