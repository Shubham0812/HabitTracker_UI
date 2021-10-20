//
//  OnboardingButton.swift
//  HabitTracker_UI
//
//  Created by Ankit Singh on 16/10/21.
//

import SwiftUI

struct OnboardingButton: View {

    // State to manage tapStatus
    @State private var isTapped = false

    // Handles the hide amount of black outer ring
    // 0 = 0% to 1 = 100% hiding
    @State private var ringHideAmount: CGFloat = 1

    // Panel factor which can be changed to decide how much amount should be filled in single tap
    // 3 = 1/3rd amount 2 = 1/2 half amount
    public var numberOfPanels: CGFloat = 3

    func updateProgressBorder() {
        ringHideAmount -= 1/numberOfPanels
    }

    var body: some View {
        // MARK: - Outer Ring
        ZStack(alignment: .center) {
            ZStack {
                // Base background for handling drop shadow
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 90, height: 90, alignment: .center
                    )
                    .foregroundColor(.white)
                    .shadow(color: Color(hex: "c3c3c3"), radius: 1, x: 0, y: 4)

                // Outer Gray Ring
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "E5E5E5"), lineWidth: 5)
                    .frame(width: 90, height: 90, alignment: .center)

                // Outer Black Ring
                RoundedRectangle(cornerRadius: 20)
                    .trim(from: ringHideAmount, to: 1)
                    .stroke(.black, lineWidth: 5)
                    .frame(width: 90, height: 90, alignment: .center)
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))

                    .animation(.spring())

            }

            // MARK: - Button Press handler
            ZStack {
                // Inner black filled rectangle
                RoundedRectangle(cornerRadius: 18)
                    .frame(width: 77, height: 79, alignment: .center)
                    .foregroundColor(.black)
                    .offset(y: 0)
                // Image
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .frame(width: 17.45, height: 29.31, alignment: .center)
            }
            .scaleEffect(isTapped ? 0.8 : 1)
            .animation(.easeInOut)
            // Tap Gesture Handle
            .onTapGesture {
                self.isTapped = true
                updateProgressBorder()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.isTapped = false
                }
            }

        }

    }
}

struct OnboardingButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButton()
    }
}
