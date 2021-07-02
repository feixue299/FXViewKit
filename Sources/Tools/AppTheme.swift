//
//  AppTheme.swift
//  FXViewKit
//
//  Created by mac on 2021/7/2.
//

import Foundation

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
        activity: UIColor(hexString: "388FCB")!,
        activity1: UIColor(hexString: "00C4EA")!,
        background: UIColor(hexString: "0F0F0F")!,
        background1: UIColor(hexString: "17171A")!,
        gradient_end: UIColor(hexString: "EB00D7")!,
        gradient_start: UIColor(hexString: "0996E6")!,
        interaction: UIColor(hexString: "97139F")!,
        interaction1: UIColor(hexString: "611797")!,
        label: UIColor(hexString: "FFFFFF")!,
        label1: UIColor(hexString: "545455")!)
    
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
