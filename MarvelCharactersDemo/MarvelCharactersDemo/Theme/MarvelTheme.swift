//
//  MarvelTheme.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit

public class MarvelTheme {
    public static let shared = MarvelTheme()
    public var fontProtocol: FontProtocol?
    public var colorProtocol: ColorProtocol?
    
    init() {
        fontProtocol = ThemeFont.shared
        colorProtocol = ThemeColor.shared
    }
}

