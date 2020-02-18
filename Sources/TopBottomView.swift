//
//  TopBottomView.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/18.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import UIKit

public class TopBottomView<Top: UIView, Bottom: UIView>: UIView {
    
    private lazy var leftConstraint: NSLayoutConstraint = topView.leftAnchor.constraint(equalTo: leftAnchor, constant: edges.left)
    private lazy var topConstraint: NSLayoutConstraint = topView.topAnchor.constraint(equalTo: topAnchor, constant: edges.top)
    private lazy var bottomConstraint: NSLayoutConstraint = topView.rightAnchor.constraint(equalTo: rightAnchor, constant: edges.right)
    private lazy var rightConstraint: NSLayoutConstraint = bottomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: edges.bottom)

    public let topView: Top
    public let bottomView: Bottom
    
    public var edges: UIEdgeInsets = .zero {
        didSet {
            leftConstraint.constant = edges.left
            topConstraint.constant = edges.top
            rightConstraint.constant = edges.right
            bottomConstraint.constant = edges.bottom
        }
    }
    
    public override init(frame: CGRect) {
        topView = Top()
        bottomView = Bottom()
        
        super.init(frame: frame)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topView)
        addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            leftConstraint,
            topConstraint,
            bottomConstraint,
            topView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            bottomView.leftAnchor.constraint(equalTo: topView.leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: topView.rightAnchor),
            rightConstraint
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

