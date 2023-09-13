//
//  BaseViewModel.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation
import Combine

/*
 Each ViewController & ViewModel should have an input & output enums

 Input enum is what viewmodel is getting
 Output enum what viewcontroller is getting

 */

protocol BaseViewModelInputMethods {
    func fetchData(apiName: Any?)
}

class BaseViewModel {
    
    weak var outputStatus: PassthroughSubject<BaseViewModel.Output, Never>?
    weak var inputStatus: PassthroughSubject<BaseViewModel.Input, Never>?

    public lazy var cancellables = Set<AnyCancellable>()
    let marvelServiceType: MarvelServiceType
    
    init(outputStatus: PassthroughSubject<BaseViewModel.Output, Never>? = nil,
         inputStatus: PassthroughSubject<BaseViewModel.Input, Never>? = nil,
         marvelServiceType: MarvelServiceType = MarvelService()) {
        self.outputStatus = outputStatus
        self.inputStatus = inputStatus
        self.marvelServiceType = marvelServiceType
        bind()
    }

    private func bind() {
        guard let inputStatus else {
            return
        }
        inputStatus.sink(receiveValue: { [weak self] event in
            guard let self = self as? BaseViewModelInputMethods else {
                return
            }
            switch event {
            case .fetchData(let apiName): self.fetchData(apiName: apiName)
            }
        }).store(in: &cancellables)
    }
}

extension BaseViewModel {
    enum Input {
        case fetchData(apiName: Any?)
    }

    enum Output {
        case showLoader
        case hideLoader
        case fetchDataResponse(response: Any?, error: Error?, apiName: Any?)
    }
}
