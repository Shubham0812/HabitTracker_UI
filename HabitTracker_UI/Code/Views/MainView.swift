//
//  ContentView.swift
//  HabitTracker_UI
//
//  Created by Shubham on 07/10/21.
//

import SwiftUI

struct MainView: View {
	@AppStorage(DefaultsManager.Keys.isOnboardingComplete.rawValue) var isOnboardingComplete: Bool = false
    
    // MARK:- views
	@ViewBuilder
    var body: some View {
		if isOnboardingComplete {
			habitsTracker
		} else {
			onboardingView
		}
    }
	
	private var onboardingView: some View {
		OnboardingView() {
			isOnboardingComplete = true
		}
	}
	
	private var habitsTracker: some View {
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
            .colorScheme(.light)
    }
}
