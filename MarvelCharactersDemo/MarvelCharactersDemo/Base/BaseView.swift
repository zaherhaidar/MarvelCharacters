//
//  BaseView.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 14/09/2023.
//

import Foundation

import UIKit

class BaseView: UIView {

    @IBOutlet weak var view: UIView!
    
     override init(frame: CGRect) {
            super.init(frame: frame)
            self.xibSetup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.xibSetup()
        }
    
        override func embeddedView() -> UIView? {
            return view
        }
    
        override func setupView() {
            super.setupView()
        }
        
        override var backgroundColor: UIColor? {
            didSet {
                view?.backgroundColor = backgroundColor
            }
        }

}
