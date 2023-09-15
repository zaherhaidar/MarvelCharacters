//
//  CharactersDetailsViewModel.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import Foundation

class CharactersDetailsViewModel: BaseViewModel, BaseViewModelInputMethods {
    var startCoordinator: CharacterDetailCoordinator?
    var tableViewData: [SectionModel] = []
//    [SectionModel(name: ApiName.comics.rawValue, rowData: []),
//                                                 SectionModel(name: ApiName.stories.rawValue, rowData: []),
//                                                 SectionModel(name: ApiName.events.rawValue, rowData: []),
//                                                 SectionModel(name: ApiName.series.rawValue, rowData: [])]
    var characterID: Int = -1

    public var numberOfSections: Int {
        return tableViewData.count
    }

    public func numberOfItems(section: Int) -> Int {
        return tableViewData[section].rowData?.count ?? 0
    }

    public func section(at section: Int) -> SectionModel? {
        if section < tableViewData.count {
            return tableViewData[section]
        }
        return nil
    }

    public func getSectionIndex(with apiName: ApiName) -> Int {
        return tableViewData.firstIndex(where: { $0.name == apiName.rawValue }) ?? -1
    }

    public func item(at section: Int, index: Int) -> RowDataModel? {
        if section < tableViewData.count, let row = tableViewData[section].rowData, index < row.count {
            return row[index]
        }
        return nil
    }

    // Get Characters

    func fetchData(apiName: Any?) {
        outputStatus?.send(.showLoader)

        if let apiNameSafe = apiName as? ApiName {
            getCharacterDetails(apiName: apiNameSafe, endPoint: apiNameSafe.rawValue)
        }
    }

    func getCharacterDetails(apiName: ApiName, endPoint: String) {
        marvelServiceType.getCharacterDetails(endpoint: endPoint, characterID: characterID, params: nil, withCache: true).sink { [weak self] completion in
            self?.outputStatus?.send(.hideLoader)
            if case let .failure(error) = completion {
                self?.outputStatus?.send(.fetchDataResponse(response: nil, error: error, apiName: nil))
            }
        } receiveValue: { [weak self] details in
            let arrDetails = details.data?.results?.get(first: 3) ?? []
            let rowData = arrDetails.map { obj in
                RowDataModel(thumbnail: obj.thumbnail, name: obj.title)
            }
            self?.outputStatus?.send(.fetchDataResponse(response: rowData, error: nil, apiName: apiName))
        }.store(in: &cancellables)
    }
}

enum ApiName: String {
    case comics
    case stories
    case events
    case series
}
