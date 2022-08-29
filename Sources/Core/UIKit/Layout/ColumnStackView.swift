//
//  ColumnStackView.swift
//  
//
//  Created by aria on 2022/8/19.
//

import UIKit

public class ColumnStackView: LayoutStackView {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    stackView.axis = .vertical
    disableHorizontal()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
