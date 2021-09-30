//
//  GradientView.swift
//  FXViewKit
//
//  Created by mac on 2021/6/30.
//

#if !os(macOS)
import UIKit

open class GradientView: UIView {
    open override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    open var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#endif
