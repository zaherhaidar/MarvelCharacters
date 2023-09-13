//
//  MarvelService+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation
import Combine

extension MarvelService: MarvelServiceType {
    
    func getCharacters() -> AnyPublisher<[CharacterModel], Error> {
        
        let cachedKey = "cachedCharacters"
       

        // Check if data is available in cache
        if let cachedCharacters = MarvelCacheManager.shared.loadFromCache([CharacterModel].self, forKey: cachedKey) {
            let cachedPublisher = Just(cachedCharacters)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()

            // Fetch data from the API in parallel with the cached data
            let apiPublisher = requestApiList(CharacterModel.self, endPoint: "characters", cachedKey: cachedKey)

            // Merge the cached data and API data
            return Publishers.Merge(cachedPublisher, apiPublisher)
                .eraseToAnyPublisher()
        } else {
            // If there's no cached data, fetch data from the API only
            return requestApiList(CharacterModel.self, endPoint: "characters", cachedKey: cachedKey)
        }
    }
    
    func getComics(characterID: Int) -> AnyPublisher<[ComicModel], Error> {
        let cachedKey = "cachedComic\(characterID)"

        // Check if data is available in cache
        if let cachedCharacters = MarvelCacheManager.shared.loadFromCache([ComicModel].self, forKey: cachedKey) {
            let cachedPublisher = Just(cachedCharacters)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()

            // Fetch data from the API in parallel with the cached data
            let apiPublisher = requestApiList(ComicModel.self, endPoint: "characters/\(characterID)/comics", cachedKey: cachedKey)

            // Merge the cached data and API data
            return Publishers.Merge(cachedPublisher, apiPublisher)
                .eraseToAnyPublisher()
        } else {
            // If there's no cached data, fetch data from the API only
            return requestApiList(ComicModel.self, endPoint: "characters/\(characterID)/comics", cachedKey: cachedKey)
        }
    }
}
