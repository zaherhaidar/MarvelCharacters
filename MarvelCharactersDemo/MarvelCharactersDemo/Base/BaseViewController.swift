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
    
    private var cancellables = Set<AnyCancellable>()
    
    lazy var  inputStatus: PassthroughSubject<BaseViewModel.Input, Never> = .init()
    
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
            case let .fetchDataResponse(response, error, responseType):
                self?.fetchDataResponse(response: response, error: error, responseType: responseType)
            }
        }.store(in: &cancellables)
        return output
    }()
    

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Change background color
        self.navigationController?.navigationBar.barTintColor = MarvelTheme.shared.colorProtocol?.primaryColor
        self.view.backgroundColor = MarvelTheme.shared.colorProtocol?.primaryColor
        // Change title color
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        bind()
    }

    // MARK: - Internal Methods
    
    // Combine
    func bind() {}
    
    // Input Status
    func fetchData(apiName: Any? = nil) {
        inputStatus.send(.fetchData(apiName: apiName))
    }
    
    // Output Status
    func fetchDataResponse(response: Any?, error: Error?, responseType: Any?) {}
}

extension UIViewController {
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
}
