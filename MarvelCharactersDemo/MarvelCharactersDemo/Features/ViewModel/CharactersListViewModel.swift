//
//  CharactersListViewModel.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Combine
import Foundation

class CharactersListViewModel: BaseViewModel, BaseViewModelInputMethods {

    var startCoordinator: CharacterListCoordinator?
    private var characters: [CharacterModel] = []
    
    public var numberOfItems: Int {
        return characters.count
    }
    
    public func item(at index: Int) -> CharacterModel? {
        if index < characters.count {
            return characters[index]
        }
        return nil
    }
    
    // Get Characters
    
    func fetchData(apiName: Any?) {
        outputStatus?.send(.showLoader)
        marvelServiceType.getCharacters().sink { [weak self] completion in
            self?.outputStatus?.send(.hideLoader)
            if case let .failure(error) = completion {
                self?.outputStatus?.send(.fetchDataResponse(response: nil, error: error, apiName: nil))
            }
        } receiveValue: { [weak self] characters in
            self?.characters = characters
            self?.outputStatus?.send(.fetchDataResponse(response: characters, error: nil, apiName: nil))
        }.store(in: &cancellables)
    }
    
    func navigateToCharacterDetailScreen(idx: Int) {
        startCoordinator?.navigateToDetailVC(model: item(at: idx))
    }
}
