//
//  StateModel.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation

struct StateModel: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [ItemModel]?
    var returned: Int?
}
