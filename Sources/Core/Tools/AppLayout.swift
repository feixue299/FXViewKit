//
//  AppLayout.swift
//  FXViewKit
//
//  Created by mac on 2021/7/1.
//

import Foundation
#if !os(macOS)
import UIKit

public struct AppLayout {
    public static var backgroundSpacing: CGFloat = 20
    public static var contentSpacing: CGFloat = 15
    public static var elementSpacing: CGFloat = 5
    public static var viewCornerRadius: CGFloat = 6
}
#endif
