//
//  CapsuleView.swift
//  FXViewKit
//
//  Created by mac on 2021/7/1.
//
#if !os(macOS)
import UIKit

open class CapsuleView<T: UIView>: UIView {

    public let contentView: T
    
    public init(contentView: T) {
        self.contentView = contentView
        super.init(frame: .zero)
        isUserInteractionEnabled = true
        configView()
    }
    
    override init(frame: CGRect) {
        self.contentView = T(frame: frame)
        super.init(frame: frame)
        isUserInteractionEnabled = true
        configView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }

}

extension CapsuleView: ContentViewProtocol {
    var containerView: UIView {
        return contentView
    }
}

#endif
