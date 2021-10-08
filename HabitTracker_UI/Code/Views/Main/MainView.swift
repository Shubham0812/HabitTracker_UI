//
//  ContentView.swift
//  HabitTracker_UI
//
//  Created by Shubham on 07/10/21.
//

import SwiftUI

struct MainView: View {
    
    // MARK:- views
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            Text("Hello, world!")
                .font(TypefaceTwo.medium.font(size: 24))
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .colorScheme(.dark)
    }
}
