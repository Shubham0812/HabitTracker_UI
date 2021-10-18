//
//  RectangleViewModel.swift
//  CircleView
//
//  Created by Sagar Pant on 16/10/21.
//

import SwiftUI

class RectangleViewModel: ObservableObject {
    @Published var isComplete: Bool
    
    var backGroundColor: Color {
        if isComplete {
            return Color("RectangleBackGroundColorGreen")
        } else {
            return Color("RectangleBackGroundColorGray")
        }
    }
    
    init (isComplete: Bool) {
        self.isComplete = isComplete
    }
}
