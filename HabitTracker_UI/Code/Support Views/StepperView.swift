//
//  StepperView.swift
//  HabitTracker_UI
//
//  Created by Mohammad Yasir on 17/10/21.
//

import SwiftUI

struct StepperView: View {
    @ObservedObject public var stepperViewModel: StepperViewModel = .init(numberOfSteps: 5, currentStep: 0)
    
    var body: some View {
        VStack {
            steppersView
        }
    }
    
    private var steppersView: some View {
        VStack(spacing: Spacing.standard.rawValue) {
            ForEach(stepperViewModel.steppers.indices, id:\.self) { index in
                let stepper = stepperViewModel.steppers[index]
                stepperView(stepper: stepper, index: index + 1) // Mark:- Incrementing to have non-zero index value
            }
        }
    }
    
    private func stepperView(
        stepper: Stepper,
        index: Int
    ) -> some View {
        VStack(spacing: Spacing.standard.rawValue) {
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(stepper.stepperColor())
                .overlay(stepperContent(stepper: stepper))
                .onTapGesture {
                    stepperViewModel.currentStep = index
                    stepperViewModel.updateStepper()
                }
            
            // Mark:- Hiding the line for the last circle
            if stepper.showStick {
                Capsule()
                    .frame(width: 4, height: 50)
                    .foregroundColor(stepper.stepperColor())
            }
        }
    }
    
    private func stepperContent(
        stepper: Stepper
    ) -> some View {
        Group {
            if stepper.completed {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .font(.title2)
            } else { Text("\(stepper.num)") }
        }
    }
}

struct Stepper {
    let num: Int
    var completed: Bool
    var showStick: Bool
    
    init(
        num: Int,
        completed: Bool = false,
        showStick: Bool = true
    ) {
        self.num = num
        self.completed = completed
        self.showStick = showStick
    }
    
    public func stepperColor() -> Color { completed ? .green : .gray.opacity(0.2) }
}

class StepperViewModel: ObservableObject {
    @Published public var steppers: [Stepper] = []
    @Published public var totalSteppers: Int
    @Published public var currentStep: Int
    
    init(
        numberOfSteps: Int,
        currentStep: Int
    ) {
        self.totalSteppers = numberOfSteps
        self.currentStep = currentStep
        
        for i in 0..<numberOfSteps {
            if i == numberOfSteps - 1 {
                steppers.append(Stepper(num: i + 1, showStick: false))
            } else { steppers.append(Stepper(num: i + 1)) }
        }
        
        updateStepper()
    }
    
    public func updateStepper() {
        for i in 0..<steppers.count { withAnimation { steppers[i].completed = i + 1 <= currentStep ? true : false } }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}

// Mark:- Few standard spacings
public enum Spacing: CGFloat {
    case low = 4
    case medium = 8
    case standard = 16
    case large = 24
    case extraLarge = 32
}
