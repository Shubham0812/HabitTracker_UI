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
		TabView {
			HabitsView()
				.tabItem {
					Label("Habits", systemImage: "checklist")
				}
			
			AnalyticsView()
				.tabItem {
					Label("Analytics", systemImage: "chart.pie")
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .colorScheme(.dark)
    }
}
