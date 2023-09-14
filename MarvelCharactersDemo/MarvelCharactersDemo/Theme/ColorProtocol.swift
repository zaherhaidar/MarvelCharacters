//
//  ColorProtocol.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import UIKit

@objc public protocol ColorProtocol {
    
    @objc optional var primaryColor: UIColor { get set }
    @objc optional var secondaryColor: UIColor { get set }
    @objc optional var tertiaryColor: UIColor { get set }
    @objc optional var whiteColor: UIColor { get set }
}
