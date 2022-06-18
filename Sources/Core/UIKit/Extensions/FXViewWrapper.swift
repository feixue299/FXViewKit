//
//  FXViewWrapper.swift
//  FXViewKit
//
//  Created by aria on 2022/6/18.
//

import Foundation

public struct FXViewWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol FXViewCompatible: AnyObject { }

public protocol FXViewCompatibleValue {}

public extension FXViewCompatible {
    /// Gets a namespace holder for Kingfisher compatible types.
    var fx: FXViewWrapper<Self> {
        get { return FXViewWrapper(self) }
        set { }
    }
}

public extension FXViewCompatibleValue {
    /// Gets a namespace holder for Kingfisher compatible types.
    var fx: FXViewWrapper<Self> {
        get { return FXViewWrapper(self) }
        set { }
    }
}

extension UIImage: FXViewCompatible { }
extension UIImageView: FXViewCompatible { }
extension UIButton: FXViewCompatible { }
