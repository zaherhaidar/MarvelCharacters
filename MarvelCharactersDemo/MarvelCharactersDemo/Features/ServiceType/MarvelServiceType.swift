//
//  MarvelServiceType.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation
import Combine

protocol MarvelServiceType {
    func getCharacters(params: [String: String]?, withCache: Bool) -> AnyPublisher<BaseListResponse<CharacterModel>, Error>
    func getCharacterDetails(endpoint: String, characterID: Int, params: [String: String]?, withCache: Bool) -> AnyPublisher<BaseListResponse<CharacterDetailModel>, Error>
}
