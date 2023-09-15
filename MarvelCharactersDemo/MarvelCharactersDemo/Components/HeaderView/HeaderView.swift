//
//  HeaderView.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 14/09/2023.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func leftButtonAction()
    func rightButtonAction()
}

class HeaderView: BaseView {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var lineView: UIView!
    
    weak var delegate: HeaderViewDelegate?
        
    var imageTitle: UIImage? {
        didSet {
            self.titleImage.image = imageTitle
            self.titleImage.isHidden = false
        }
    }
    
    var title: String {
        get {
            return titleLabel.text ?? ""
        }
        set {
            titleLabel.isHidden = newValue.isEmpty
            titleLabel?.text = newValue
        }
    }
    
    var titleTextStyle: TextStyle? {
        didSet {
            titleLabel.customize(style: titleTextStyle)
        }
    }
    
    var numberOfLines: Int {
        get {
            return titleLabel.numberOfLines
        } set {
            titleLabel.numberOfLines = newValue
        }
    }
    
    var rightButtonStyle: ButtonStyle? {
        didSet {
            rightButton.customize(style: rightButtonStyle)
        }
    }
    
    var rightButtonImage: UIImage? {
        didSet {
            rightButton.setImage(rightButtonImage, for: .normal)
        }
    }

    var showRightButton: Bool {
        get {
            return !rightButton.isHidden
        } set {
            rightButton.isHidden = !newValue
        }
    }
    
    var showLeftButton: Bool {
        get {
            return !leftButton.isHidden
        } set {
            leftButton.isHidden = !newValue
        }
    }
    
    func setupHeaderView(leftTitle: String = "",
                         leftIcon: String = "arrow_back",
                         leftColor: UIColor = MarvelTheme.shared.colorProtocol?.secondaryColor ?? .white,
                         titleImage: String = "",
                         titleLabel: String = "",
                         titleColor: UIColor = MarvelTheme.shared.colorProtocol?.primaryColor ?? .black,
                         rightTitle: String = "",
                         rightIcon: String = "",
                         rightColor: UIColor = MarvelTheme.shared.colorProtocol?.primaryColor ?? .black,
                         rightFontStyle: TextStyle? = nil) {
    
        self.leftButton.isHidden = leftTitle.isEmpty && leftIcon.isEmpty
        lineView.isHidden = true
        self.leftButton.setTitle(leftTitle, for: .normal)
        self.leftButton.setTitleColor(leftColor, for: .normal)
        
        if leftTitle.isEmpty {
            self.leftButton.setImage(UIImage(named: leftIcon), for: .normal)
            self.leftButton.tintColor = leftColor
        }
        
        self.titleLabel.isHidden = titleLabel.isEmpty
        self.titleLabel.text = titleLabel
        self.titleLabel.customize(style: (MarvelTheme.shared.fontProtocol?.bodyXB18, MarvelTheme.shared.colorProtocol?.secondaryColor ?? .white))
        self.titleImage.isHidden = titleImage.isEmpty
        
        if !titleImage.isEmpty {
            self.titleImage.image = UIImage(named: titleImage)
            self.titleImage.tintColor = titleColor
        }
        
        if !titleLabel.isEmpty {
            self.titleLabel.text = titleLabel
        }
        
        self.rightButton.isHidden = rightTitle.isEmpty && rightIcon.isEmpty
       
        rightButton.customize(style: (rightTitle, (MarvelTheme.shared.fontProtocol?.bodyS18, MarvelTheme.shared.colorProtocol?.primaryColor ?? .black), .clear))
        
        if !rightIcon.isEmpty {
            self.rightButton.setImage(UIImage(named: rightIcon), for: .normal)
            self.rightButton.tintColor = rightColor
        }
                
    }
    
    @IBAction func leftAction(_ sender: Any) {
        if let onLeftButtonTap = delegate?.leftButtonAction {
            onLeftButtonTap()
        }
    }
    
    @IBAction func rightAction(_ sender: Any) {
        if let onRightButtonTap = delegate?.rightButtonAction {
            onRightButtonTap()
        }
    }
    
}
