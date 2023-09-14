//
//  SectionModel.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import Foundation

struct SectionModel {
    var name: String?
    var rowData: [RowDataModel]?
}

struct RowDataModel {
    var thumbnail: ThumbnailModel?
    var name: String?
}
