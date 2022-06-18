//
//  UIImage+Blur.swift
//  FXViewKit
//
//  Created by aria on 2022/6/18.
//

import UIKit

public extension FXViewCompatible {
    var blur: FXViewWrapper<Self> {
        get { return FXViewWrapper(self) }
        set { }
    }
}

public extension FXViewWrapper where Base: UIImage {
    
    func coreImage(_ closure: ((UIImage?) -> ())? = nil) {
        DispatchQueue.global().async {
            let context = CIContext()
            guard let cgImage = base.cgImage else {
                closure?(nil)
                return
            }
            let ciImage = CIImage(cgImage: cgImage)
            let filter = CIFilter(name: "CIGaussianBlur")
            filter?.setValue(ciImage, forKey: kCIInputImageKey)
            //设置模糊程度
            filter?.setValue(30, forKey: "inputRadius")
            guard let result = filter?.value(forKey: kCIOutputImageKey) as? CIImage else {
                closure?(nil)
                return
            }
            let frame = ciImage.extent
            guard let outImage = context.createCGImage(result, from: frame) else {
                closure?(nil)
                return
            }
            let blurImage = UIImage(cgImage: outImage)
            DispatchQueue.main.async {
                closure?(blurImage)
            }
        }
    }
    
}

