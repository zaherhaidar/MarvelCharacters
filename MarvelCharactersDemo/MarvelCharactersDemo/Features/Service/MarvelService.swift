//
//  MarvelService.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation
import Combine

class MarvelService {
    func requestApiList<T: Codable>(_ type: T.Type, endPoint: String, params: [String: String]?, withCache: Bool, cachedKey: String) -> AnyPublisher<BaseListResponse<T>, Error> {
        
        guard let apiURL = ApiBuilder.buildServiceRequestUrl(endPoint: endPoint, params: params) else {
            let error = NSError(domain: "URl", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL is nil"])
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: apiURL)
            .catch { error in
                Fail(error: error).eraseToAnyPublisher()
            }
            .tryMap { data, _ -> BaseListResponse<T> in
                guard let jsonString = String(data: data, encoding: .utf8) else {
                    throw URLError(.cannotDecodeRawData)
                }
                print("\(endPoint) --> \(jsonString)")
                let response = try JSONDecoder().decode(BaseListResponse<T>.self, from: data)

                // Save data to cache
                
                if withCache {
                    MarvelCacheManager.shared.saveToCache(response.data?.results ?? [], forKey: cachedKey)
                }

                return response
            }
            .eraseToAnyPublisher()
    }
}
