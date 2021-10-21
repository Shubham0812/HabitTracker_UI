//
//  ProgressStepperModel.swift
//  HabitTracker_UI
//
//  Created by Shahriar Nasim Nafi on 16/10/21.
//

import SwiftUI


class ProgressStepperModel: ObservableObject {
    
    @Published var currentStepperCount: Int = 0
    
    func increase() {
        currentStepperCount+=1
    }
    
    func decrease() {
        currentStepperCount-=1
    }

}
