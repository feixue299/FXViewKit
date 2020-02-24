//
//  TopBottomView.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/18.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import UIKit

open class TopBottomView<Top: UIView, Bottom: UIView>: UIView {
    
    private lazy var topViewLeftConstraint = topView.leftAnchor.constraint(equalTo: leftAnchor, constant: edges.left)
    private lazy var topConstraint = topView.topAnchor.constraint(equalTo: topAnchor, constant: edges.top)
    private lazy var topViewRightConstraint = topView.rightAnchor.constraint(equalTo: rightAnchor, constant: -edges.right)
    private lazy var bottomConstraint = bottomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom)
    private lazy var bottomViewLeftConstraint = bottomView.leftAnchor.constraint(equalTo: leftAnchor, constant: edges.left)
    private lazy var bottomViewRightConstraint = bottomView.rightAnchor.constraint(equalTo: rightAnchor, constant: edges.right)

    public let topView: Top
    public let bottomView: Bottom
    
    public var edges: UIEdgeInsets = .zero {
        didSet {
            topViewLeftConstraint.constant = edges.left
            bottomViewLeftConstraint.constant = edges.left
            topConstraint.constant = edges.top
            topViewRightConstraint.constant = -edges.right
            bottomViewRightConstraint.constant = -edges.right
            bottomConstraint.constant = -edges.bottom
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
            topViewLeftConstraint,
            topConstraint,
            bottomConstraint,
            topView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            bottomViewLeftConstraint,
            bottomViewRightConstraint,
            topViewRightConstraint
        ])
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

