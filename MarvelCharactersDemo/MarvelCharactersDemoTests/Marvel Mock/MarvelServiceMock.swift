//
//  MarvelServiceMock.swift
//  MarvelCharactersDemoTests
//
//  Created by zaher haidar on 15/09/2023.
//

import Combine
@testable import MarvelCharactersDemo
import XCTest

class MarvelServiceMock: MarvelServiceType {
    func getCharacters(params: [String : String]?, withCache: Bool) -> AnyPublisher<BaseListResponse<CharacterModel>, Error> {
        let mockResponseJson = try! JsonMock.init("CharacterDetailsResponse")
        return convertJSONToPublisher(jsonResponse: mockResponseJson.jsonResponse ?? [:])
    }
    
    func getCharacterDetails(endpoint: String, characterID: Int, params: [String : String]?, withCache: Bool) -> AnyPublisher<BaseListResponse<CharacterDetailModel>, Error> {
        return Empty<BaseListResponse<CharacterDetailModel>, Error>()
                .eraseToAnyPublisher()
    }
    
    func convertJSONToPublisher(jsonResponse: [String: Any]) -> AnyPublisher<BaseListResponse<CharacterModel>, Error> {
        
        return Future<BaseListResponse<CharacterModel>, Error> { promise in
            do {
                // Serialize the JSON data to Data
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResponse, options: [])

                // Use JSONDecoder to decode the JSON data into your desired Swift object
                let decoder = JSONDecoder()
                let result = try decoder.decode(BaseListResponse<CharacterModel>.self, from: jsonData)

                // Complete the Future with the decoded result
                promise(.success(result))
            } catch {
                // Handle any decoding or serialization errors
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
