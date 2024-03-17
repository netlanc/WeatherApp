//
//  OptionsFactory.swift
//  WeatherApp
//
//  Created by netlanc on 25.02.2024.
//

import UIKit


enum FontSize: CGFloat {
    case small = 12.0
    case base = 14.0
    case medium = 16.0
    case large = 18.0
    case xLarge = 20.0
    case xxLarge = 30.0
    case xxxLarge = 36.0
}

enum ColorEnum {
    case white
    case lightPink
    case blue
    case lightBlue
    case gray
    case red
    case orange
    case cyan
    case green
    case lightGreen
    case lightGray
    case customGray
    case customLightGray
    case transparent
    case orangeLight
    case orangeDark
    case dark
    
    var color: UIColor {
        switch self {
        case .white:
            return .white
        case .lightPink:
            return UIColor(red: 254/255, green: 237/255, blue: 233/255, alpha: 1)
        case .blue:
            return UIColor(red: 32/255, green: 78/255, blue: 199/255, alpha: 1)
        case .lightBlue:
            return UIColor(red: 171/255, green: 188/255, blue: 234/255, alpha: 1)
        case .gray:
            return .gray
        case .red:
            return .red
        case .orange:
            return .orange
        case .cyan:
            return .cyan
        case .green:
            return .green
        case .lightGreen:
            return UIColor(red: 234/255, green: 250/255, blue: 233/255, alpha: 1)
        case .lightGray:
            return .lightGray
        case .customGray:
            return UIColor(red: 137/255, green: 131/255, blue: 131/255, alpha: 1)
        case .customLightGray:
            return UIColor(red: 233/255, green: 238/255, blue: 250/255, alpha: 1)
        case .dark:
            return UIColor(red: 39/255, green: 39/255, blue: 34/255, alpha: 1)
        case .transparent:
            return UIColor(white: 0, alpha: 0)
        case .orangeLight:
            return UIColor(red: 242/255, green: 110/255, blue: 17/255, alpha: 1)
        case .orangeDark:
            return UIColor(red: 198/255, green: 86/255, blue: 7/255, alpha: 1)
        }
    }
}

enum ButtonType {
    case primary
    case secondary
    case danger
    case warning
    case info
    case success
    case transparent
    case orangeLight
    case orangeDark
    case dark
    case light
    case base
    
    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return ColorEnum.blue.color
        case .secondary:
            return ColorEnum.gray.color
        case .danger:
            return ColorEnum.red.color
        case .warning:
            return ColorEnum.orange.color
        case .info:
            return ColorEnum.lightPink.color
        case .success:
            return ColorEnum.green.color
        case .transparent:
            return ColorEnum.transparent.color
        case .orangeLight:
            return ColorEnum.orangeLight.color
        case .orangeDark:
            return ColorEnum.orangeDark.color
        case .dark:
            return ColorEnum.dark.color
        case .light:
            return ColorEnum.white.color
        case .base:
            return ColorEnum.lightGray.color
        }
    }
}

enum ButtonSize {
    case small
    case medium
    case large
    case base
    
    var contentEdgeInsets: UIEdgeInsets {
        switch self {
        case .small:
            return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        case .medium:
            return UIEdgeInsets(top: 12.5, left: 20, bottom: 12.5, right: 20)
        case .large:
            return UIEdgeInsets(top: 15, left: 30, bottom: 15, right: 30)
        case .base:
            return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        }
    }
}

struct ButtonOption {
    let type: ButtonType?
    let size: ButtonSize?
    let shadowEnabled: Bool
    let fontSize: FontSize
    let cornerRadius: CGFloat?
    
    init(type: ButtonType? = nil, size: ButtonSize? = nil, shadowEnabled: Bool = false, fontSize: FontSize = .medium, cornerRadius: CGFloat? = 10) {
        self.type = type
        self.size = size
        self.shadowEnabled = shadowEnabled
        self.fontSize = fontSize
        self.cornerRadius = cornerRadius
    }
}

struct LabelOption {
    let fontSize: FontSize
    let fontWeight: UIFont.Weight
    let lineHeight: CGFloat?
    let textColor: ColorEnum
    let textAlignment: NSTextAlignment
    let isUnderlined: Bool
    let isMultiline: Bool
    
    init(fontSize: FontSize = .base, fontWeight: UIFont.Weight = .regular, lineHeight: CGFloat? = 1.0, textColor: ColorEnum = .dark, textAlignment: NSTextAlignment = .left, isUnderlined: Bool = false, isMultiline: Bool = false) {
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.lineHeight = lineHeight
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.isUnderlined = isUnderlined
        self.isMultiline = isMultiline
    }
}

struct ImageOption {
    let width: CGFloat?
    
    init(width: CGFloat? = nil) {
        self.width = width
    }
}

struct CustomSwitcherOption {
    let titleText: String
    let button1Text: String
    let button2Text: String
    let buttonSize: ButtonSize
    let buttonActive: Int8
    let value1: String
    let value2: String
}
