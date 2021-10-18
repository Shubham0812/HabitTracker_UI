//
//  CircleViewModel.swift
//  CircleView
//
//  Created by Sagar Pant on 16/10/21.
//

import SwiftUI

class CircleViewModel: ObservableObject {
    @Published var isComplete: Bool
    @Published var nodeNum: Int
    
    var backgroundColor: Color {
        if isComplete {
            return Color("CircleBackGroundColorGreen")
        } else {
            return Color("CircleBackGroundColorGray")
        }
    }
    
    var text: String {
        if isComplete {
            return String("\u{2714}\u{FE0E}")
        } else {
            return String(nodeNum)
        }
    }
    
    var foregroundColor: Color {
        if isComplete {
            return .white
        } else {
            return .black
        }
    }
    
    init (nodeNum: Int,
          isComplete: Bool) {
        self.isComplete = isComplete
        self.nodeNum = nodeNum
    }
}

