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
    ///Color with Hex:  #0F6EFF
    public var secondaryColor = #colorLiteral(red: 0.05882352941, green: 0.431372549, blue: 1, alpha: 1)
    ///Color with Hex:  #9AA1A9
    public var tertiaryColor = #colorLiteral(red: 0.6039215686, green: 0.631372549, blue: 0.662745098, alpha: 1)
    ///Color with Hex:  #FFFFFF
    public var whiteColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}
