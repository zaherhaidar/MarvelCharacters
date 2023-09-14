//
//  UIButton+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 14/09/2023.
//

import UIKit

extension UIButton {
    
    func customize(style: ButtonStyle?,
                   state: UIControl.State = .normal) {
        if let style = style {
            if let textSafe = style.text {
                setTitle(textSafe, for: .normal)
            }
            titleLabel?.font = style.textStyle.font
            setTitleColor(style.textStyle.color, for: state)
            backgroundColor = style.backgroundColor
        }
    }
    
    func enableBtn(_ enable: Bool) {
        isEnabled = enable
        alpha = enable ? 1 : 0.4
        setTitleColor(currentTitleColor, for: .disabled)
    }
    
    func setButtonImage(image: UIImage,
                        tintColor: UIColor,
                        horizontalAlignment: UIControl.ContentHorizontalAlignment = .center,
                        imageInsets: UIEdgeInsets = .zero,
                        titleInsets: UIEdgeInsets = .zero,
                        buttonState: UIControl.State = .normal) {
        setImage(image, for: buttonState)
        contentHorizontalAlignment = horizontalAlignment
        self.imageEdgeInsets = imageInsets
        self.titleEdgeInsets = titleInsets
        self.tintColor = tintColor
    }
}
