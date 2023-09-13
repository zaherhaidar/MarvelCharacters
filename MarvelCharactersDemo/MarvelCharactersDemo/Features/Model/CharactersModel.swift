//
//  CharactersModel.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation

struct CharacterModel: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var modified: String?
    var resourceURI: String?
    var thumbnail: ThumbnailModel?
    var comics: StateModel?
    var series: StateModel?
    var stories: StateModel?
    var events: StateModel?
    var urls: [CharacterUrlModel]?
}
