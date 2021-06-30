//
//  GradientView.swift
//  FXViewKit
//
//  Created by mac on 2021/6/30.
//

import UIKit

open class GradientView: UIView {
    open override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    open var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
}
