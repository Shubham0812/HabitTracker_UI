//
//  RectangleView.swift
//  CircleView
//
//  Created by Sagar Pant on 16/10/21.
//

import SwiftUI

struct RectangleView: View {
    
    @StateObject var rectangleViewModel: RectangleViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(width: 10, height: 40, alignment: .center)
            .foregroundColor(rectangleViewModel.backGroundColor)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(rectangleViewModel: RectangleViewModel(isComplete: true))
    }
}
