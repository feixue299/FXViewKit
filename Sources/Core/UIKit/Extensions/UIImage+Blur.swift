//
//  UIImage+Blur.swift
//  FXViewKit
//
//  Created by aria on 2022/6/18.
//

import UIKit
import Accelerate

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
    
    func vimage(blur: CGFloat = 0.5) -> UIImage? {
        let blur = (0...1).contains(blur) ? blur : 0.5
        var boxSize = Int(blur * 40)
        boxSize = boxSize - (boxSize % 2) + 1
        
        guard let img = base.cgImage else { return nil }
        
        var inBuffer = vImage_Buffer()
        var outBuffer = vImage_Buffer()
        var error: vImage_Error?
        
        var pixelBuffer: UnsafeMutableRawPointer?
        
        guard let inProvider = img.dataProvider, let inBitmapData = inProvider.data else { return nil }
        
        //设置从CGImage获取对象的属性
        inBuffer.width = vImagePixelCount(img.width)
        inBuffer.height = vImagePixelCount(img.height)
        inBuffer.rowBytes = img.bytesPerRow
        
        inBuffer.data = .init(mutating: CFDataGetBytePtr(inBitmapData))
        
        pixelBuffer = malloc(img.bytesPerRow * img.height)
        
        if pixelBuffer == nil {
            print("No pixelbuffer")
        }
        
        outBuffer.data = pixelBuffer
        outBuffer.width = vImagePixelCount(img.width)
        outBuffer.height = vImagePixelCount(img.height)
        outBuffer.rowBytes = img.bytesPerRow
        
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, nil, 0, 0, UInt32(boxSize), UInt32(boxSize), nil, vImage_Flags(kvImageEdgeExtend))
        
        if let error = error {
            print("error from convolution \(error)")
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let ctx = CGContext(data: outBuffer.data, width: Int(outBuffer.width), height: Int(outBuffer.height), bitsPerComponent: 8, bytesPerRow: outBuffer.rowBytes, space: colorSpace, bitmapInfo: img.bitmapInfo.rawValue), let cgImage = ctx.makeImage() else { return nil }
        
        let returnImage = UIImage(cgImage: cgImage)
        
        free(pixelBuffer)
        
        return returnImage
    }
    
}

