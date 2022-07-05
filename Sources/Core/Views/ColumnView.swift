//
//  ColumnView.swift
//  FXViewKit
//
//  Created by aria on 2022/7/4.
//

import UIKit

open class ColumnView: LayoutView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.axis = .vertical
        disableHorizontalScroll()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
