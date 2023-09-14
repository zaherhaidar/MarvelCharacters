//
//  CharacterDetailModel.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation

struct CharacterDetailModel: Codable {
    var id: Int?
    var digitalId: Int?
    var title: String?
    var issueNumber: Int?
    var variantDescription: String?
    var description: String?
    var modified: String?
    var isbn: String?
    var upc: String?
    var diamondCode: String?
    var resourceURI: String?
    var thumbnail: ThumbnailModel?
}
