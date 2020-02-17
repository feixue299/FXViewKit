//
//  LeftRightView.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/18.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import UIKit

public class LeftRightView<Left: UIView, Right: UIView>: UIView {
    
    private lazy var leftConstraint: NSLayoutConstraint = leftView.leftAnchor.constraint(equalTo: leftAnchor, constant: edges.left)
    private lazy var topConstraint: NSLayoutConstraint = leftView.topAnchor.constraint(equalTo: topAnchor, constant: edges.top)
    private lazy var bottomConstraint: NSLayoutConstraint = leftView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom)
    private lazy var rightConstraint: NSLayoutConstraint = rightView.rightAnchor.constraint(equalTo: rightAnchor, constant: -edges.right)

    public let leftView: Left
    public let rightView: Right
    
    public var edges: UIEdgeInsets = .zero {
        didSet {
            leftConstraint.constant = edges.left
            topConstraint.constant = edges.top
            rightConstraint.constant = -edges.right
            bottomConstraint.constant = -edges.bottom
        }
    }
    
    public override init(frame: CGRect) {
        leftView = Left()
        rightView = Right()
        
        super.init(frame: frame)
        
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftView)
        addSubview(rightView)
        
        NSLayoutConstraint.activate([
            leftConstraint,
            topConstraint,
            bottomConstraint,
            leftView.rightAnchor.constraint(equalTo: rightView.leftAnchor),
            rightView.topAnchor.constraint(equalTo: leftView.topAnchor),
            rightView.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
            rightConstraint
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
