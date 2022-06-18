//
//  Calyer+Extensions.swift
//  FXViewKit
//
//  Created by hard on 2021/10/26.
//

import Foundation

public extension CALayer {
    /// 脉冲效果
    func pulseAnimation() {
        let duration: Double = 1.8
        do {
            let keyPath = "opacity"
            if animation(forKey: keyPath) == nil {
                let animation = CAKeyframeAnimation(keyPath: keyPath)
                animation.values = [1, 0.6, 0.2, 0.1, 0, 0]
                animation.repeatCount = .infinity
                animation.duration = duration
                
                animation.timingFunction = CAMediaTimingFunction(name: .linear)
                add(animation, forKey: keyPath)
            }
        }
        do {
            let keyPath = "transform.scale.xy"
            if animation(forKey: keyPath) == nil {
                let animation = CAKeyframeAnimation(keyPath: keyPath)
                animation.values = [1, 1.18, 1.2, 1.22, 1.3, 1.3]
                animation.repeatCount = .infinity
                animation.duration = duration
                
                animation.timingFunction = CAMediaTimingFunction(name: .linear)
                add(animation, forKey: keyPath)
            }
        }
    }
}
