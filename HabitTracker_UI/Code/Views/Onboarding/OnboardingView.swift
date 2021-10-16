//
//  OnboardingView.swift
//  HabitTracker_UI
//
//  Created by Shubham on 08/10/21.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK:- variables

    
    // MARK:- views
    var body: some View {
        ZStack {
            Button("", action: {})
                .buttonStyle(OnBoardingButtonStyle(max: 3))
                .frame(width: 90,
                       height: 90)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
