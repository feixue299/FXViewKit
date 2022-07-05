//
//  RowFixedView.swift
//  
//
//  Created by aria on 2022/7/5.
//

import UIKit

public class RowFixedView: RowView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        disableHorizontalScroll()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
