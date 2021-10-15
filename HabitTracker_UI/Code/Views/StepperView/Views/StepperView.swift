//
//  CircleNumberView.swift
//  CircleView
//
//  Created by Sagar Pant on 15/10/21.
//

import SwiftUI

struct StepperView: View {
    
    @StateObject var stepperViewModel: StepperViewModel
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ForEach(1..<stepperViewModel.currentNode) { i in
                CircleView(circleViewModel: CircleViewModel(nodeNum: i, isComplete: true))
                RectangleView(rectangleViewModel: RectangleViewModel(isComplete: true))
                
            }
            ForEach(stepperViewModel.currentNode..<stepperViewModel.totalNodes) { i in
                CircleView(circleViewModel: CircleViewModel(nodeNum: i, isComplete: false))
                RectangleView(rectangleViewModel: RectangleViewModel(isComplete: false))
            }
            CircleView(circleViewModel: CircleViewModel(nodeNum: stepperViewModel.totalNodes, isComplete: stepperViewModel.isLastNodeComplete))
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView(stepperViewModel: StepperViewModel(totalNodes: 6, currentNode: 6))
    }
}
