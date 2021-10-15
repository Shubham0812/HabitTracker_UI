//
//  HapticsManager.swift
//  HabitTracker_UI
//
//  Created by Prabaljit Walia on 15/10/21.
//

import Foundation
import UIKit

class HapticsManager{
    static let instance = HapticsManager()
    func hapticFeedback(type:UINotificationFeedbackGenerator.FeedbackType){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
