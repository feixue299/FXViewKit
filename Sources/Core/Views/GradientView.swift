//
//  GradientView.swift
//  FXViewKit
//
//  Created by mac on 2021/6/30.
//

#if !os(macOS)
import UIKit

open class GradientView<T: UIView>: UIView {
    open override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    open var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    public let contentView: T
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public init(contentView: T) {
        self.contentView = contentView
        super.init(frame: .zero)
        configView()
    }
    
    public override init(frame: CGRect) {
        self.contentView = T()
        super.init(frame: frame)
        isUserInteractionEnabled = false
        configView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GradientView: ContentViewProtocol {
    var containerView: UIView {
        return contentView
    }
}
#endif
