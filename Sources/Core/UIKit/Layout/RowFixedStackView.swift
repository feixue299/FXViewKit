//
//  RowFixedStackView.swift
//  
//
//  Created by aria on 2022/8/22.
//

import UIKit

public class RowFixedStackView: RowStackView {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    disableHorizontal()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
