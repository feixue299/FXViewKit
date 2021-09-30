//
//  ShadowView.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/25.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

#if !os(macOS)
import UIKit

public class ShadowView<View: UIView>: UIView {
    
    public let contentView: View
    
    public override init(frame: CGRect) {
        contentView = View()
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.shadowColor = UIColor(white: 0, alpha: 0.16).cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.cornerRadius = 5
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#endif
