//
//  ColumnFixedView.swift
//  
//
//  Created by aria on 2022/7/5.
//

import UIKit

public class ColumnFixedView: ColumnView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        disableVerticalScroll()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
