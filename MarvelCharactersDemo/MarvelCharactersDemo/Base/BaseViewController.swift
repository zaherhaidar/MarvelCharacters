//
//  BaseViewController.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Combine
import UIKit

class BaseViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet var headerView: HeaderView?
    @IBOutlet var headerViewHeightConstraint: NSLayoutConstraint?
    private var cancellables = Set<AnyCancellable>()

    lazy var inputStatus: PassthroughSubject<BaseViewModel.Input, Never> = .init()

    lazy var outputStatus: PassthroughSubject<BaseViewModel.Output, Never> = {
        let output = PassthroughSubject<BaseViewModel.Output, Never>.init()
        output
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                switch event {
                case .showLoader:
                    self?.showLoader()
                case .hideLoader:
                    self?.hideLoader()
                case let .fetchDataResponse(response, error, apiName):
                    self?.fetchDataResponse(response: response, error: error, apiName: apiName)
                }
            }.store(in: &cancellables)
        return output
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MarvelTheme.shared.colorProtocol?.primaryColor
        setupHeaderView()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        
    }

    // MARK: - Internal Methods

    // Combine
    func bind() {}

    func setupHeaderView() {
        if let headerView = headerView {
            headerView.setupHeaderView()
            headerView.delegate = self
            headerView.leftButton.isHidden = navigationController?.isRootViewController ?? true
            headerView.rightButton.isHidden = true
        }
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let statusBarManager = windowScene.statusBarManager {
            headerViewHeightConstraint?.constant += statusBarManager.statusBarFrame.height
        }
    }

    // Input Status
    func fetchData(apiName: Any? = nil) {
        inputStatus.send(.fetchData(apiName: apiName))
    }

    // Output Status
    func fetchDataResponse(response: Any?, error: Error?, apiName: Any?) {}
}

extension UIViewController {
    func showLoader() {
    }

    func hideLoader() {
    }
}

extension BaseViewController: HeaderViewDelegate {
    func leftButtonAction() {
        navigationController?.popViewController(animated: true)
    }

    func rightButtonAction() {
    }
}
