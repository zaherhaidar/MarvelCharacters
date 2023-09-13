//
//  MarvelConfig.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit

public class MarvelConfig: NSObject {
    
    public static let `default` = MarvelConfig()
    
    public class func setupInstance() {
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-Black", fontExtension: "ttf")
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-BlackItalic", fontExtension: "ttf")
        
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-Bold", fontExtension: "ttf")
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-BoldItalic", fontExtension: "ttf")
        
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-ExtraBold", fontExtension: "ttf")
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-ExtraBoldItalic", fontExtension: "ttf")
        
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-ExtraLight", fontExtension: "ttf")
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-ExtraLightItalic", fontExtension: "ttf")
        
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-Italic", fontExtension: "ttf")
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-Regular", fontExtension: "ttf")
        UIFont.registerFont(bundle: Bundle.main, fontName: "NunitoSans-Light", fontExtension: "ttf")
    }
}
