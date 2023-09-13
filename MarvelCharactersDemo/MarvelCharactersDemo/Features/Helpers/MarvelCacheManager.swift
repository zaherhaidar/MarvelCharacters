//
//  MarvelCacheManager.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation

class MarvelCacheManager {
    static let shared = MarvelCacheManager()

    private let cacheKey = "cachedCharacters"

    func saveToCache<T: Codable>(_ value: T, forKey key: String) {
        if let encodedData = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }

    func loadFromCache<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        if let encodedData = UserDefaults.standard.data(forKey: key),
           let decodedValue = try? JSONDecoder().decode(type, from: encodedData) {
            return decodedValue
        }
        return nil
    }
}
