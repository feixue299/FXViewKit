//
//  RowStackView.swift
//  
//
//  Created by aria on 2022/8/19.
//

import UIKit

public class RowStackView: LayoutStackView {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    stackView.axis = .horizontal
    disableVertical()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
