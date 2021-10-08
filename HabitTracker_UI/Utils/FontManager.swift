//
//  FontManager.swift
//  HabitTracker_UI
//
//  Created by Shubham on 08/10/21.
//

import SwiftUI

enum TypefaceOne {
    case regular
    case medium
    case semibold
    case semiboldItalic
    case bold
    case boldItalic
    
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("Montserrat-Regular", size: size)
        case .medium:
            return .custom("Montserrat-Medium", size: size)
        case .semibold:
            return .custom("Montserrat-SemiBold", size: size)
        case .semiboldItalic:
            return .custom("Montserrat-SemiBoldItalic", size: size)
        case .bold:
            return .custom("Montserrat-Bold", size: size)
        case .boldItalic:
            return .custom("Montserrat-BoldItalic", size: size)
        }
    }
}

enum TypefaceTwo {
    case light
    case regular
    case medium
    case mediumItalic
    case semibold
    case semiboldItalic
    case bold
    case boldItalic
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .light:
            return .custom("Raleway-Light", size: size)
        case .regular:
            return .custom("Raleway-Regular", size: size)
        case .medium:
            return .custom("Raleway-Medium", size: size)
        case .mediumItalic:
            return .custom("Raleway-MediumItalic", size: size)
        case .semibold:
            return .custom("Raleway-SemiBold", size: size)
        case .semiboldItalic:
            return .custom("Raleway-SemiBoldItalic", size: size)
        case .bold:
            return .custom("Raleway-Bold", size: size)
        case .boldItalic:
            return .custom("Raleway-BoldItalic", size: size)
        }
    }
}
