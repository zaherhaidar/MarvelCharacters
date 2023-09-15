//
//  ThemeColor.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit

public class ThemeColor: ColorProtocol {
    static let shared = ThemeColor()
    
    ///Color with Hex:  #000000
    public var primaryColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    ///Color with Hex:  #FFFFFF
    public var secondaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    ///Color with Hex:  #FF3B30
    public var tertiaryColor = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
}
