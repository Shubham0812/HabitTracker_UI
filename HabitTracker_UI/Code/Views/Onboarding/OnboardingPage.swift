//
//  OnboardingPage.swift
//  HabitTracker_UI
//
//  Created by Anmol Jain on 16/10/21.
//

import SwiftUI

struct OnboardingPage: View {
	private var name: String
	private var heading: String
	private var content: String
	
	init(withImage name: String, heading: String, and content: String) {
		self.name = name
		self.heading = heading
		self.content = content
	}
	
	var body: some View {
		VStack(spacing: 0) {
			Image(name)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.flipsForRightToLeftLayoutDirection(true)
			
			VStack(spacing: 5) {
				Text(heading)
					.font(TypefaceOne.semibold.font(size: 18))
				Text(content)
					.font(TypefaceTwo.regular.font(size: 16))
					.lineLimit(nil)
					.multilineTextAlignment(.center)
					.frame(width: Constants.appWidth * 0.7)
			}
			.padding(.horizontal, 30)
			.frame(width: Constants.appWidth * 0.9, height: Constants.appWidth * 0.3)
		}
	}
}
