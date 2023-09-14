//
//  ShimmeringViewProtocol.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 14/09/2023.
//

import UIKit

public protocol ShimmeringViewProtocol where Self: UIView {
    var shimmeringAnimatedItems: [UIView] { get }
    var excludedItems: Set<UIView> { get }
}

extension ShimmeringViewProtocol {
    public var shimmeringAnimatedItems: [UIView] { [self] }
    public var excludedItems: Set<UIView> { [] }
}

