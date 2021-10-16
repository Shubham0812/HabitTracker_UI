//
//  IncompletedStepperItemView.swift
//  HabitTracker_UI
//
//  Created by Shahriar Nasim Nafi on 16/10/21.
//

import SwiftUI

struct IncompletedStepperItemView: View {
    
    var number: Int = 1
    var isLastItem: Bool = false
    var circleSize: CGSize = CGSize(width: 40, height: 40)
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(.gray.opacity(0.2))
                    .frame(width: circleSize.width, height: circleSize.height, alignment: .center)
                Text(String(number))
                    .font(.system(size: Double(circleSize.width / 2)))
                    .fontWeight(.heavy)
            }
            if !isLastItem {
                Rectangle()
                    .frame(width: circleSize.width / 10, height: circleSize.height + 10, alignment: .center)
                    .foregroundColor(.gray.opacity(0.2))
                    .padding(.top, 6)
            }
          
        }
        .padding(.bottom, 6)
    }
}

struct IncompletedStepperItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IncompletedStepperItemView()
            IncompletedStepperItemView(isLastItem: true)
        }
    }
}
