//
//  ThumbnailModel.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation

struct ThumbnailModel: Codable {
    var path: String?
    var ext: String?
    
    private enum CodingKeys: String, CodingKey {
        case path = "path"
        case ext = "extension"
    }
}
