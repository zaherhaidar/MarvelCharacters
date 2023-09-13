//
//  CharactersListViewController.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit
import Combine

class CharactersListViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    lazy var viewModel = CharactersListViewModel(outputStatus: outputStatus, inputStatus: inputStatus)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchData()
    }

    // MARK: - Internal Methods
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterTableViewCell")

        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func fetchDataResponse(response: Any?, error: Error?, responseType: Any?) {
        if let error = error {
            // show error
        } else {
            if let characters = response as? [CharacterModel] {
                characters.count > 0 ? tableView.reloadData() : nil
            }
        }
        
    }
}

extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let item = viewModel.item(at: indexPath.row)
        cell.setupCell(name: item?.name, imageUrl: "\(item?.thumbnail?.path ?? "").\(item?.thumbnail?.ext ?? "")")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToCharacterDetailScreen(idx: indexPath.row)
    }
}

