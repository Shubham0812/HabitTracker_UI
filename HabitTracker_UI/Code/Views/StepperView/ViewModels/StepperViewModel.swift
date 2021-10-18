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
    
    private var isLastNodeComplete: Bool {
        return currentNode == totalNodes
    }
    
    func isNodeComplete(index: Int) -> Bool {
        if index < currentNode {
            return true
        } else if index < totalNodes {
            return false
        }
        return isLastNodeComplete
    }
    
    init(totalNodes: Int,
         currentNode: Int) {
        self.totalNodes = totalNodes
        self.currentNode = min(currentNode, totalNodes)
    }
}

