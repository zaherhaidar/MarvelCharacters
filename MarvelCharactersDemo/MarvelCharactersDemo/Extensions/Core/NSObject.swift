//
//  NSObject.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 13/09/2023.
//

import Foundation

extension NSObject {
    static var typeName: String {
        return String(describing: self)
    }
    
    var typeName: String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }
}
