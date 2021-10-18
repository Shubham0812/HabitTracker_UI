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
            ForEach(1..<stepperViewModel.totalNodes) { i in
                CircleView(circleViewModel: CircleViewModel(nodeNum: i, isComplete: stepperViewModel.isNodeComplete(index: i)))
                RectangleView(rectangleViewModel: RectangleViewModel(isComplete: stepperViewModel.isNodeComplete(index: i)))
            }
            CircleView(circleViewModel: CircleViewModel(nodeNum: stepperViewModel.totalNodes, isComplete: stepperViewModel.isNodeComplete(index: stepperViewModel.totalNodes)))
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView(stepperViewModel: StepperViewModel(totalNodes: 7, currentNode: 3))
    }
}
