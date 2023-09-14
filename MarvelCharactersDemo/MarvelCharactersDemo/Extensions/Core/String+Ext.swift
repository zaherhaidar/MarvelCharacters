//
//  String+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 14/09/2023.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
