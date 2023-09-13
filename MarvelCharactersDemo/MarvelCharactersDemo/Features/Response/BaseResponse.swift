//
//  BaseResponse.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var code: Int?
    var data: T?
}

struct BaseListResponse<T: Codable>: Codable {
    var code: Int?
    var data: ListResponse<T>?
}

struct ListResponse<T: Codable>: Codable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [T]?
}
