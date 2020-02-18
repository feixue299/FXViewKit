//
//  ContentView.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/18.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

import UIKit

public class ContentView<View: UIView>: UIView {
    
    private lazy var leftConstraint: NSLayoutConstraint = contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: edges.left)
    private lazy var topConstraint: NSLayoutConstraint = contentView.topAnchor.constraint(equalTo: topAnchor, constant: edges.top)
    private lazy var bottomConstraint: NSLayoutConstraint = contentView.rightAnchor.constraint(equalTo: rightAnchor, constant: edges.right)
    private lazy var rightConstraint: NSLayoutConstraint = contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: edges.bottom)
    
    public let contentView: View
    
    public var edges: UIEdgeInsets = .zero {
        didSet {
            leftConstraint.constant = edges.left
            topConstraint.constant = edges.top
            rightConstraint.constant = edges.right
            bottomConstraint.constant = edges.bottom
        }
    }
    
    public override init(frame: CGRect) {
        contentView = View()
        super.init(frame: frame)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        NSLayoutConstraint.activate([leftConstraint, topConstraint, bottomConstraint, rightConstraint])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
