//
//  HabitsView.swift
//  HabitTracker_UI
//
//  Created by Anmol Jain on 16/10/21.
//

import SwiftUI

struct HabitsView: View {
    var body: some View {
		NavigationView {
			List {
				Text("Add Habits")
				Text("Be able to track habits")
				Text("Edit/Delete existing habits")
				
				// Replace these points with actual UI, which might be a list
				// view, fetching results from CoreData
				
			}
			.background(color: Color.background)
			.navigationTitle("Home")
		}
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
