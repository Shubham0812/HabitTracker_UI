//
//  CompletedStepperItemView.swift
//  HabitTracker_UI
//
//  Created by Shahriar Nasim Nafi on 16/10/21.
//

import SwiftUI

struct CompletedStepperItemView: View {
    var isLastItem: Bool = false
    var circleSize: CGSize = CGSize(width: 40, height: 40)
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: circleSize.width, height: circleSize.height, alignment: .center)
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: circleSize.width / 2.6, height: circleSize.height / 2.6, alignment: .center)
                    .foregroundColor(.white)
            }
            if !isLastItem {
                Rectangle()
                    .frame(width: circleSize.width / 10, height: circleSize.height + 10, alignment: .center)
                    .foregroundColor(.green)
                    .padding(.top, 6)
            }
          
        }
        .padding(.bottom, 6)
    }
}

struct CompletedStepperItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CompletedStepperItemView()
            CompletedStepperItemView(isLastItem: true)
        }
    }
}
