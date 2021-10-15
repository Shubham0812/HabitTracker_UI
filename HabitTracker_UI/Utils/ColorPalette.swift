//
//  ColorPalette.swift
//  HabitTracker_UI
//
//  Created by Shahriar Nasim Nafi on 15/10/21.
//
import SwiftUI
import UIKit


enum ColorPalette {
    case primary
    case secondary
    case accent
    case warning
    case background
    var color: Color {
        switch self {
            case .primary:
            return Color(primaryUIColor)
            case .secondary:
            return Color(secondaryUIColor)
            case .accent:
            return Color(accentUIColor)
            case .warning:
            return Color(warningUIColor)
            case .background:
            return Color(backgroundUIColor)
        }
    }

    private var primaryUIColor: UIColor {
        UIColor {
            traits in
            if traits.userInterfaceStyle == .light {
                return UIColor(hex: "#6237FF")
            }
            else if traits.userInterfaceStyle == .dark {
                return UIColor(hex: "#6971D3")
            }
            return UIColor(hex: "#6237FF")
        }
    }

    private var secondaryUIColor: UIColor {
        UIColor {
            traits in
            if traits.userInterfaceStyle == .light {
                return UIColor(hex: "#F86C28")
            }
            else if traits.userInterfaceStyle == .dark {
                return UIColor(hex: "#FFBA8F")
            }
            return UIColor(hex: "#F86C28")
        }
    }

    private var accentUIColor: UIColor {
        UIColor {
            traits in
            if traits.userInterfaceStyle == .light {
                return UIColor(hex: "#1FB9FC")
            }
            else if traits.userInterfaceStyle == .dark {
                return UIColor(hex: "#50C7F3")
            }
            return UIColor(hex: "#1FB9FC")
        }
    }

    private var warningUIColor: UIColor {
        UIColor {
            traits in
            if traits.userInterfaceStyle == .light {
                return UIColor(hex: "#F7456D")
            }
            else if traits.userInterfaceStyle == .dark {
                return UIColor(hex: "#D79AB8")
            }
            return UIColor(hex: "#F7456D")
        }
    }

    private var backgroundUIColor: UIColor {
        UIColor {
            traits in
            if traits.userInterfaceStyle == .light {
                return UIColor(hex: "#ffffff")
            }
            else if traits.userInterfaceStyle == .dark {
                return UIColor(hex: "#000000")
            }
            return UIColor(hex: "#ffffff")
        }
    }

}
