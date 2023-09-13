//
//  MarvelService.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation
import Combine

class MarvelService {
    func requestApiList<T: Codable>(_ type: T.Type, endPoint: String, cachedKey: String) -> AnyPublisher<[T], Error> {
        
        guard let apiURL = ApiBuilder.buildServiceRequestUrl(endPoint: endPoint) else {
            let error = NSError(domain: "URl", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL is nil"])
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: apiURL)
            .catch { error in
                Fail(error: error).eraseToAnyPublisher()
            }
            .tryMap { data, _ -> [T] in
                guard let jsonString = String(data: data, encoding: .utf8) else {
                    throw URLError(.cannotDecodeRawData)
                }
                print("\(endPoint) --> \(jsonString)")
                let characters = try JSONDecoder().decode(BaseListResponse<T>.self, from: data)

                // Save data to cache
                MarvelCacheManager.shared.saveToCache(characters.data?.results ?? [], forKey: cachedKey)

                return characters.data?.results ?? []
            }
            .eraseToAnyPublisher()
    }
}
