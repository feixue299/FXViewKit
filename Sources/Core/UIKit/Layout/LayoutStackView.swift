//
//  LayoutStackView.swift
//  
//
//  Created by aria on 2022/8/19.
//

import UIKit

public class LayoutStackView: UIScrollView {
  
  public let stackView = UIStackView()

  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    stackView.spacing = 0
    stackView.distribution = .equalSpacing
    stackView.alignment = .fill
    
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func disableHorizontal() {
    NSLayoutConstraint.activate([
      stackView.widthAnchor.constraint(equalTo: widthAnchor),
    ])
  }
  
  public func disableVertical() {
    NSLayoutConstraint.activate([
      stackView.heightAnchor.constraint(equalTo: heightAnchor),
    ])
  }
  
  public func addArrangedSubview(_ view: UIView) {
    stackView.addArrangedSubview(view)
  }
  
  public func addArrangedSubviews(_ views: [UIView]) {
    views.forEach(addArrangedSubview)
  }
  
}
