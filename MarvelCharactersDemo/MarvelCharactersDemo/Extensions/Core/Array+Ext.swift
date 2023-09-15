//
//  Array+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 15/09/2023.
//

import Foundation

extension Array {
    func get(first: Int) -> Array {
        return count >= first ? Array(self[..<first]) : self
    }
}
