//
//  StepperViewModel.swift
//  CircleView
//
//  Created by Sagar Pant on 16/10/21.
//

import SwiftUI

class StepperViewModel: ObservableObject {
    @Published var totalNodes: Int
    @Published var currentNode: Int
    
    var isLastNodeComplete: Bool {
        return currentNode == totalNodes
    }
    
    init(totalNodes: Int,
         currentNode: Int) {
        self.totalNodes = totalNodes
        self.currentNode = min(currentNode, totalNodes)
    }
}

