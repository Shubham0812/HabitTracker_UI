//
//  ProgressStepperVIew.swift
//  HabitTracker_UI
//
//  Created by Shahriar Nasim Nafi on 16/10/21.
//

import SwiftUI

struct ProgressStepperVIew: View {
    @ObservedObject var progressStepperModel: ProgressStepperModel
    
    /// Dynamically set `ProgressStepperItemView`'s frame size. `GeometryReader` is the best candidate`
    var stepperItemFrameSize: CGSize = CGSize(width: UIScreen.main.bounds.width / 13, height: UIScreen.main.bounds.width / 13)
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack {
                    stepperViewType(position: 1, size: stepperItemFrameSize)
                    stepperViewType(position: 2, size: stepperItemFrameSize)
                    stepperViewType(position: 3, size: stepperItemFrameSize)
                    stepperViewType(position: 4, lastItem: true, size: stepperItemFrameSize)
                }
                .padding(.leading, 30)
                Spacer()
            }
            
            #if DEBUG
            
            HStack {
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        progressStepperModel.increase()
                    }
                }) {
                    Text("+")
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                }
                .disabled(progressStepperModel.currentStepperCount == 4)
                
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        progressStepperModel.decrease()
                    }
                   
                }) {
                    Text("-")
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.gray.opacity(0.3))
                }
                .disabled(progressStepperModel.currentStepperCount == 0)
            }
            
            #endif
        }
    }
    
    @ViewBuilder
    func stepperViewType(position: Int, lastItem: Bool = false, size: CGSize) -> some View {
        if position <= progressStepperModel.currentStepperCount {
             CompletedStepperItemView(isLastItem: lastItem, circleSize: size)
        } else {
             IncompletedStepperItemView(number: position, isLastItem: lastItem, circleSize: size)
        }
    }
}

struct ProgressStepperVIew_Previews: PreviewProvider {
    static var previews: some View {
        ProgressStepperVIew(progressStepperModel: ProgressStepperModel())
            
    }
}
