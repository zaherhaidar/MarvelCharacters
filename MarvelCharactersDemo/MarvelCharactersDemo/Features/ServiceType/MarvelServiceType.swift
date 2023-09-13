//
//  MarvelServiceType.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation
import Combine

protocol MarvelServiceType {
    func getCharacters() -> AnyPublisher<[CharacterModel], Error>
    func getComics(characterID: Int) -> AnyPublisher<[ComicModel], Error>
}
