//
//  CircleView.swift
//  CircleView
//
//  Created by Sagar Pant on 16/10/21.
//

import SwiftUI

struct CircleView: View {
    
    @StateObject var circleViewModel: CircleViewModel
    
    var body: some View {
        
        return Text(circleViewModel.text)
            .font(.title)
            .foregroundColor(circleViewModel.foregroundColor)
            .padding()
            .background(
                Circle()
                    .foregroundColor(circleViewModel.backgroundColor)
            )
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(circleViewModel: CircleViewModel(nodeNum: 9, isComplete: false))
    }
}
