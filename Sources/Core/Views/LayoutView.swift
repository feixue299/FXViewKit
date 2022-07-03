//
//  LayoutView.swift
//  FXViewKit
//
//  Created by aria on 2022/7/4.
//

import UIKit

open class LayoutView: UIScrollView {

    public let stackView = UIStackView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
