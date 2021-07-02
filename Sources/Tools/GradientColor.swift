//
//  GradientColor.swift
//  FXViewKit
//
//  Created by mac on 2021/7/2.
//

import Foundation

public struct GradientColor: CaseIterable {
    public let colors: [UIColor]
}

public extension GradientColor {
    // pink
    static let JShine = GradientColor(colors: ["#12c2e9", "#c471ed", "#f64f59"].map({ UIColor(hexString: $0)! }))
    static let AzurePop = GradientColor(colors: ["#ef32d9", "#89fffd"].map({ UIColor(hexString: $0)! }))
    static let Dania = GradientColor(colors: ["#BE93C5", "#7BC6CC"].map({ UIColor(hexString: $0)! }))
    static let Timber = GradientColor(colors: ["#fc00ff", "#00dbde"].map({ UIColor(hexString: $0)! }))
    static let Atlas = GradientColor(colors: ["#FEAC5E", "#C779D0", "#4BC0C8"].map({ UIColor(hexString: $0)! }))
    static let BlackRosé = GradientColor(colors: ["#f4c4f3", "#fc67fa"].map({ UIColor(hexString: $0)! }))
    
    // other
    static let CoolBlues = GradientColor(colors: ["#2193b0", "#6dd5ed"].map({ UIColor(hexString: $0)! }))
    static let Memariani = GradientColor(colors: ["#aa4b6b", "#6b6b83", "#3b8d99"].map({ UIColor(hexString: $0)! }))
    static let AzurLane = GradientColor(colors: ["#7F7FD5", "#86A8E7", "#3b8d99"].map({ UIColor(hexString: $0)! }))
    static let KyeMeh = GradientColor(colors: ["#8360c3", "#2ebf91"].map({ UIColor(hexString: $0)! }))
    static let ByDesign = GradientColor(colors: ["#009FFF", "#ec2F4B"].map({ UIColor(hexString: $0)! }))
    static let EveningNight = GradientColor(colors: ["#005AA7", "#FFFDE4"].map({ UIColor(hexString: $0)! }))
    static let RedSunset = GradientColor(colors: ["#355C7D", "#6C5B7B", "#C06C84"].map({ UIColor(hexString: $0)! }))
    static let WeddingDayBlues = GradientColor(colors: ["#40E0D0", "#FF8C00", "#C06C84"].map({ UIColor(hexString: $0)! }))
    static let Quepal = GradientColor(colors: ["#11998e", "#38ef7d"].map({ UIColor(hexString: $0)! }))
    static let PunYeta = GradientColor(colors: ["#108dc7", "#ef8e38"].map({ UIColor(hexString: $0)! }))
    static let Ohhappiness = GradientColor(colors: ["#00b09b", "#96c93d"].map({ UIColor(hexString: $0)! }))
    static let DigitalWater = GradientColor(colors: ["#74ebd5", "#ACB6E5"].map({ UIColor(hexString: $0)! }))
    static let Subu = GradientColor(colors: ["#0cebeb", "#20e3b2", "#29ffc6"].map({ UIColor(hexString: $0)! }))
    static let Telegram = GradientColor(colors: ["#1c92d2", "#f2fcfe"].map({ UIColor(hexString: $0)! }))
    static let Transfile = GradientColor(colors: ["#16BFFD", "#CB3066"].map({ UIColor(hexString: $0)! }))
    static let RoseWater = GradientColor(colors: ["#E55D87", "#5FC3E4"].map({ UIColor(hexString: $0)! }))
    static let Sky = GradientColor(colors: ["#076585", "#fff"].map({ UIColor(hexString: $0)! }))
    
    static var pinkCases: [GradientColor] = [
        JShine,
        AzurePop,
        Dania,
        Timber,
        Atlas,
        BlackRosé,
    ]
    
    static var allCases: [GradientColor] = [
        JShine,
        CoolBlues,
        Memariani,
        AzurLane,
        KyeMeh,
        ByDesign,
        EveningNight,
        RedSunset,
        WeddingDayBlues,
        Quepal,
        PunYeta,
        Ohhappiness,
        DigitalWater,
        Subu,
        Telegram,
        AzurePop,
        Dania,
        Transfile,
        Timber,
        Atlas,
        RoseWater,
        Sky,
        BlackRosé,
    ]
}

public extension UIView {
    enum Direction {
        case topLeft
        case left
        case bottomLeft
        case top
        case topRight
        case right
        case bottomRight
        
        var point: CGPoint {
            switch self {
            case .topLeft:
                return CGPoint(x: 0, y: 0)
            case .left:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeft:
                return CGPoint(x: 0, y: 1)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .topRight:
                return CGPoint(x: 1, y: 0)
            case .right:
                return CGPoint(x: 1, y: 0.5)
            case .bottomRight:
                return CGPoint(x: 1, y: 1)
            }
        }
    }
    
    func configGradientColor(_ color: GradientColor?, directions: (start: Direction, end: Direction) = (.bottomLeft, .topRight)) {
        if let layer = layer as? CAGradientLayer, let color = color {
            layer.colors = color.colors.map(\.cgColor)
            layer.startPoint = directions.start.point
            layer.endPoint = directions.end.point
        }
    }
}

private extension UIColor {
    /// SwifterSwift: Create Color from hexadecimal string with optional transparency (if applicable).
    ///
    /// - Parameters:
    ///   - hexString: hexadecimal string (examples: EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
    ///   - transparency: optional transparency value (default is 1).
    convenience init?(hexString: String, transparency: CGFloat = 1) {
        var string = ""
        if hexString.lowercased().hasPrefix("0x") {
            string =  hexString.replacingOccurrences(of: "0x", with: "")
        } else if hexString.hasPrefix("#") {
            string = hexString.replacingOccurrences(of: "#", with: "")
        } else {
            string = hexString
        }

        if string.count == 3 { // convert hex to 6 digit format if in short format
            var str = ""
            string.forEach { str.append(String(repeating: String($0), count: 2)) }
            string = str
        }

        guard let hexValue = Int(string, radix: 16) else { return nil }

        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        let red = (hexValue >> 16) & 0xff
        let green = (hexValue >> 8) & 0xff
        let blue = hexValue & 0xff
        self.init(red: red, green: green, blue: blue, transparency: trans)
    }
    /// SwifterSwift: Create Color from RGB values with optional transparency.
    ///
    /// - Parameters:
    ///   - red: red component.
    ///   - green: green component.
    ///   - blue: blue component.
    ///   - transparency: optional transparency value (default is 1).
    convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }

        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
    }
}
