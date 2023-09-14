//
//  MarvelService+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation
import Combine

extension MarvelService: MarvelServiceType {
    
    func getCharacters(params: [String: String]?, withCache: Bool) -> AnyPublisher<BaseListResponse<CharacterModel>, Error> {
        
        let cachedKey = "cachedCharacters"
       

        // Check if data is available in cache
        if let cachedCharacters = MarvelCacheManager.shared.loadFromCache([CharacterModel].self, forKey: cachedKey) {
            let cachedBaseListResponse = BaseListResponse(code: 200, data: ListResponse(results: cachedCharacters))
            let cachedPublisher = Just(cachedBaseListResponse)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()

            // Fetch data from the API in parallel with the cached data
            let apiPublisher = requestApiList(CharacterModel.self, endPoint: "characters", params: params, withCache: withCache, cachedKey: cachedKey)

            // Merge the cached data and API data
            return Publishers.Merge(cachedPublisher, apiPublisher)
                .eraseToAnyPublisher()
        } else {
            // If there's no cached data, fetch data from the API only
            return requestApiList(CharacterModel.self, endPoint: "characters", params: params, withCache: withCache, cachedKey: cachedKey)
        }
    }
    
    func getCharacterDetails(endpoint: String, characterID: Int, params: [String: String]?, withCache: Bool) -> AnyPublisher<BaseListResponse<CharacterDetailModel>, Error> {
        let cachedKey = "cached\(endpoint)-\(characterID)"
        let endPoint = "characters/\(characterID)/\(endpoint)"
        // Check if data is available in cache
        if let cachedCharacters = MarvelCacheManager.shared.loadFromCache([CharacterDetailModel].self, forKey: cachedKey) {
            let cachedBaseListResponse = BaseListResponse(code: 200, data: ListResponse(results: cachedCharacters))
            let cachedPublisher = Just(cachedBaseListResponse)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()

            // Fetch data from the API in parallel with the cached data
            let apiPublisher = requestApiList(CharacterDetailModel.self, endPoint: endPoint, params: params, withCache: withCache, cachedKey: cachedKey)

            // Merge the cached data and API data
            return Publishers.Merge(cachedPublisher, apiPublisher)
                .eraseToAnyPublisher()
        } else {
            // If there's no cached data, fetch data from the API only
            return requestApiList(CharacterDetailModel.self, endPoint: endPoint, params: params, withCache: withCache, cachedKey: cachedKey)
        }
    }
}
