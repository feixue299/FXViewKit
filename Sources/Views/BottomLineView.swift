//
//  BottomLineView.swift
//  FXViewKit
//
//  Created by Mr.wu on 2020/2/25.
//  Copyright © 2020 Mr.wu. All rights reserved.
//

#if !os(macOS)
import UIKit

public class BottomLineView<View: UIView>: UIView {

    public let contentView: View
    public let lineView = UIView()
    
    public override init(frame: CGRect) {
        contentView = View()
        super.init(frame: frame)
        
        lineView.backgroundColor = .groupTableViewBackground
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        addSubview(lineView)
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: lineView.topAnchor),
            lineView.leftAnchor.constraint(equalTo: leftAnchor),
            lineView.rightAnchor.constraint(equalTo: rightAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
#endif
