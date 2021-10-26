//
//  CapsuleView.swift
//  FXViewKit
//
//  Created by mac on 2021/7/1.
//
#if !os(macOS)
import UIKit

open class CapsuleView: UIView {
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
#endif
