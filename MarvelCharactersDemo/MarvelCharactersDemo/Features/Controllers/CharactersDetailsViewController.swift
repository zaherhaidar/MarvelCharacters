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
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    // MARK: - Properties

    lazy var viewModel = CharactersDetailsViewModel(outputStatus: outputStatus, inputStatus: inputStatus)
    var character: CharacterModel?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupTableView()
        viewModel.characterID = character?.id ?? -1
        
        let dispatchGroup = DispatchGroup()

        let concurrentQueue = DispatchQueue(label: "characterDetails.concurrentQueue", attributes: .concurrent)

        concurrentQueue.async(group: dispatchGroup) {
            self.fetchData(apiName: ApiName.comics)
        }

        concurrentQueue.async(group: dispatchGroup) {
            self.fetchData(apiName: ApiName.series)
        }

        concurrentQueue.async(group: dispatchGroup) {
            self.fetchData(apiName: ApiName.events)
        }
        
        concurrentQueue.async(group: dispatchGroup) {
            self.fetchData(apiName: ApiName.stories)
        }
        
        dispatchGroup.wait()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Internal Methods

    override func setupHeaderView() {
        super.setupHeaderView()
        headerView?.title = "Character Info"
    }
    
    private func setupInterface() {
        titleLabel.text = character?.name
        titleLabel.customize(style: (MarvelTheme.shared.fontProtocol?.bodyXB16, MarvelTheme.shared.colorProtocol?.secondaryColor))
        detailLabel.customize(style: (MarvelTheme.shared.fontProtocol?.bodyM16, MarvelTheme.shared.colorProtocol?.secondaryColor))
        detailLabel.text = character?.description
        if let urlSafe = URL(string: "\(character?.thumbnail?.path ?? "").\(character?.thumbnail?.ext ?? "")") {
            characterImageView.kf.setImage(with: urlSafe)
        }
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "CharacterDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterDetailTableViewCell")

        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func fetchDataResponse(response: Any?, error: Error?, apiName: Any?) {
        if let error = error {
            // show error
        } else {
            if let rowData = response as? [RowDataModel], rowData.count > 0, let apiName = apiName as? ApiName {
                let section = viewModel.getSectionIndex(with: apiName)
                DispatchQueue.main.async {
                    if section != -1 {
                        self.viewModel.tableViewData[section].rowData = rowData
                        self.tableView.reloadRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
                    } else {
                        self.viewModel.tableViewData.append(SectionModel(name: apiName.rawValue, rowData: rowData))
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}

extension CharactersDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25))
        let sectionItem = viewModel.section(at: section)?.name?.capitalizingFirstLetter()

        let label = PaddingLabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25))
        label.text = sectionItem
        let style = (MarvelTheme.shared.fontProtocol?.bodyXB17, MarvelTheme.shared.colorProtocol?.secondaryColor)
        label.customize(style: style)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.padding(8, 8, 0, 0)
        headerView.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            label.leftAnchor.constraint(equalTo: headerView.leftAnchor),
            label.rightAnchor.constraint(equalTo: headerView.rightAnchor),
        ])

        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDetailTableViewCell", for: indexPath) as? CharacterDetailTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let item = viewModel.section(at: indexPath.section)
        cell.data = item?.rowData
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
}
