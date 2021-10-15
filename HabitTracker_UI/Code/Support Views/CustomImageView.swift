//
//  CustomImageView.swift
//  HabitTracker_UI
//
//  Created by Shahriar Nasim Nafi on 15/10/21.
//

import SwiftUI

struct CustomImage: View {
    var imageName: String
    var lineWidth: CGFloat
    var borderColor: Color
    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(borderColor, lineWidth: lineWidth))
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(imageName: "boat", lineWidth: 2, borderColor: Color.yellow)
            .padding()
            .previewLayout(.fixed(width: 80, height: 80))
    }
}
