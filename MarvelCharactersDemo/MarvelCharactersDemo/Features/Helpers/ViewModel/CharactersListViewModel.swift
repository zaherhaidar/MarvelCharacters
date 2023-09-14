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
    var isPagination: Bool = false
    var totalDataCount: Int = 0
    var pageIndex: Int = 0
    
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
        marvelServiceType.getCharacters(params: nil, withCache: !isPagination).sink { [weak self] completion in
            self?.outputStatus?.send(.hideLoader)
            if case let .failure(error) = completion {
                self?.outputStatus?.send(.fetchDataResponse(response: nil, error: error, apiName: nil))
            }
        } receiveValue: { [weak self] characters in
            if self?.isPagination ?? false {
                self?.characters.append(contentsOf: characters.data?.results ?? [])
            } else {
                self?.characters = characters.data?.results ?? []
            }
            self?.totalDataCount = characters.data?.total ?? 0
            self?.outputStatus?.send(.fetchDataResponse(response: self?.characters, error: nil, apiName: nil))
        }.store(in: &cancellables)
    }
    
    func navigateToCharacterDetailScreen(idx: Int) {
        startCoordinator?.navigateToDetailVC(model: item(at: idx))
    }
}
