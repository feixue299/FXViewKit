//
//  LeftRightView.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/18.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import UIKit

open class LeftRightView<Left: UIView, Right: UIView>: UIView {
    
    private lazy var leftConstraint = leftView.leftAnchor.constraint(equalTo: leftAnchor, constant: edges.left)
    private lazy var leftViewTopConstraint = leftView.topAnchor.constraint(equalTo: topAnchor, constant: edges.top)
    private lazy var leftViewBottomConstraint = leftView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom)
    private lazy var rightConstraint = rightView.rightAnchor.constraint(equalTo: rightAnchor, constant: -edges.right)
    private lazy var rightViewTopConstraint = rightView.topAnchor.constraint(equalTo: topAnchor, constant: edges.top)
    private lazy var rightViewBottomConstraint = rightView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom)
    private lazy var centerLineConstraint = leftView.rightAnchor.constraint(equalTo: rightView.leftAnchor, constant: space)

    public let leftView: Left
    public let rightView: Right
    
    public var space: CGFloat = 0 {
        didSet {
            centerLineConstraint.constant = -space
        }
    }
    public var edges: UIEdgeInsets = .zero {
        didSet {
            leftConstraint.constant = edges.left
            leftViewTopConstraint.constant = edges.top
            rightViewTopConstraint.constant = edges.top
            rightConstraint.constant = -edges.right
            leftViewBottomConstraint.constant = -edges.bottom
            rightViewBottomConstraint.constant = -edges.bottom
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
            leftViewTopConstraint,
            leftViewBottomConstraint,
            centerLineConstraint,
            rightViewTopConstraint,
            rightViewBottomConstraint,
            rightConstraint
        ])
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
