//
//  OnBoardingButton.swift
//  HabitTracker_UI
//
//  Created by Alexander Puchta on 16.10.21.
//

import SwiftUI

struct OnBoardingButtonStyle {
    let max: CGFloat
}


// MARK: - ButtonStyle

extension OnBoardingButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        ButtonView(configuration: configuration,
                   max: self.max)
    }
}


// MARK: - ButtonView

private extension OnBoardingButtonStyle {
    
    struct ButtonView: View {
        
        @Environment(\.isEnabled)
        private var isEnabled: Bool
        
        @State
        private var status: CGFloat = Constants.start
        
        let configuration: ButtonStyleConfiguration
        let max: CGFloat
        
        
        // MARK: - View
        
        var body: some View {
            self.content
                .onChange(of: self.configuration.isPressed,
                          perform: self.handleOnChangeIsPressed)
        }
    }
}


// MARK: - Constants

private extension OnBoardingButtonStyle.ButtonView {
    
    struct Constants {
        static let background = Color.init(hex: "E5E5E5")
        static let cornerRadius: CGFloat = 20
        static let icon: String = "chevron.right"
        static let paddingWhite: CGFloat = 5
        static let paddingBlack: CGFloat = 8
        static let rotation: CGFloat = 270
        static let shadowColor = Color.black.opacity(0.25)
        static let shadowRadius: CGFloat = 4
        static let shadowX: CGFloat = 0
        static let shadowY: CGFloat = 4
        static let start: CGFloat = 1
    }
}


// MARK: - Views

private extension OnBoardingButtonStyle.ButtonView {
    
    var content: some View {
        ZStack {
            // background with shadow
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Constants.background)
                .shadow(color: Constants.shadowColor,
                        radius: Constants.shadowRadius,
                        x: Constants.shadowX,
                        y: Constants.shadowY)
            
            // current status view
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .trim(from: self.status, to: Constants.start)
                .rotation(.degrees(Constants.rotation))
                .fill(.black)
            
            // white border view
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(.white)
                .padding(Constants.paddingWhite)
            
            // black background of chevron
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(.black)
                .padding(Constants.paddingBlack)
            
            Image(systemName: Constants.icon)
                .foregroundColor(.white)
        }
    }
}


// MARK: - Helper

private extension OnBoardingButtonStyle.ButtonView {
    
    /// Handle pressed status of button
    /// - Parameter isPressed: status of user interaction
    func handleOnChangeIsPressed(_ isPressed: Bool) {
        
        guard isPressed else {
            return
        }
        
        withAnimation(.easeIn(duration: 0.33)) {
            self.status -= Constants.start / self.max
        }
    }
}
