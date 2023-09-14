//
//  UILabel+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 14/09/2023.
//

import UIKit

public typealias TextStyle = (font: UIFont?, color: UIColor?)
public typealias ButtonStyle = (text: String?, textStyle: TextStyle, backgroundColor: UIColor?)

extension UILabel {
    func customize(style: TextStyle?) {
        if let style = style {
            font = style.font
            textColor = style.color
        }
    }
}
