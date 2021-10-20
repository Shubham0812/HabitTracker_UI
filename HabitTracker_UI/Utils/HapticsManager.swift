//
//  HapticsManager.swift
//  HabitTracker_UI
//
//  Created by Prabaljit Walia on 20/10/21.
//

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
