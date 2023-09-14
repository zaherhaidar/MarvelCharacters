//
//  UIView+Ext.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 14/09/2023.
//

import UIKit

extension UIView {
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func xibSetup() {
        let bundle = Bundle(for: type(of: self))
        let fileName = self.typeName
        if let _ = bundle.path(forResource: fileName, ofType: "nib") {
            bundle.loadNibNamed(fileName, owner: self, options: nil)
        }
        
        if let view = embeddedView() {
            view.frame = self.bounds
            addAutoLayoutSubview(view)
        }
        
        setupView()
    }
    
    @objc func setupView() {
    }
    
    @objc func embeddedView() -> UIView? {
        return nil
    }
    
    public func addAutoLayoutSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)

        var anchors = [NSLayoutConstraint]()
        anchors.append(topAnchor.constraint(equalTo: subview.topAnchor, constant: 0))
        anchors.append(bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: 0))
        anchors.append(leadingAnchor.constraint(equalTo: subview.leadingAnchor, constant: 0))
        anchors.append(trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: 0))
        NSLayoutConstraint.activate(anchors)
    }
    
    func applyTopCornerRadiusIfNeeded(_ topOnlyCornerRadius: CGFloat) {
        layer.cornerRadius = topOnlyCornerRadius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func applyBottomCornerRadiusIfNeeded(_ bottomOnlyCornerRadius: CGFloat) {
        layer.cornerRadius = bottomOnlyCornerRadius
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func applyRightCornerRadiusIfNeeded(_ rightOnlyCornerRadius: CGFloat) {
        layer.cornerRadius = rightOnlyCornerRadius
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func applyLeftCornerRadiusIfNeeded(_ leftOnlyCornerRadius: CGFloat) {
        layer.cornerRadius = leftOnlyCornerRadius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
}
