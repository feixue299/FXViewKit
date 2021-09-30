//
//  AppTheme.swift
//  FXViewKit
//
//  Created by mac on 2021/7/2.
//

import Foundation
#if !os(macOS)
import UIKit

public struct AppTheme {
    public let activity: UIColor
    public let activity1: UIColor
    public let background: UIColor
    public let background1: UIColor
    public let gradient_end: UIColor
    public let gradient_start: UIColor
    public let interaction: UIColor
    public let interaction1: UIColor
    public let label: UIColor
    
    public let label1: UIColor
    
    public static var currentTheme: AppTheme = dark
    public static let dark = AppTheme(
        activity: #colorLiteral(red: 0.2196078431, green: 0.5607843137, blue: 0.7960784314, alpha: 1),
        activity1: #colorLiteral(red: 0, green: 0.768627451, blue: 0.9176470588, alpha: 1),
        background: #colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1),
        background1: #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.1019607843, alpha: 1),
        gradient_end: #colorLiteral(red: 0.9215686275, green: 0, blue: 0.8431372549, alpha: 1),
        gradient_start: #colorLiteral(red: 0.03529411765, green: 0.5882352941, blue: 0.9019607843, alpha: 1),
        interaction: #colorLiteral(red: 0.5921568627, green: 0.07450980392, blue: 0.6235294118, alpha: 1),
        interaction1: #colorLiteral(red: 0.3803921569, green: 0.09019607843, blue: 0.5921568627, alpha: 1),
        label: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
        label1: #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.3333333333, alpha: 1))
    
    public static var activity: UIColor { return currentTheme.activity}
    public static var activity1: UIColor { return currentTheme.activity1}
    public static var background: UIColor { return currentTheme.background}
    public static var background1: UIColor { return currentTheme.background1}
    public static var gradient_end: UIColor { return currentTheme.gradient_end}
    public static var gradient_start: UIColor { return currentTheme.gradient_start}
    public static var interaction: UIColor { return currentTheme.interaction}
    public static var interaction1: UIColor { return currentTheme.interaction1}
    public static var label: UIColor { return currentTheme.label}
    public static var label1: UIColor { return currentTheme.label1}
}
#endif
