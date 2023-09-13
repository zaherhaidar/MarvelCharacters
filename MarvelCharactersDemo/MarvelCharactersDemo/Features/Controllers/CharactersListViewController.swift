//
//  ViewController.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit
import Combine

class CharactersListViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    // MARK: - Internal Methods
    
    private func setupTableView() {
        beneficiariesTableView.backgroundColor = .clear
        beneficiariesTableView.register(UINib(nibName: "BeneficiaryItemCell", bundle: nil), forCellReuseIdentifier: "BeneficiaryItemCell")

        beneficiariesTableView.allowsSelection = true
        beneficiariesTableView.separatorStyle = .none
        beneficiariesTableView.dataSource = self
        beneficiariesTableView.delegate = self
    }
}

