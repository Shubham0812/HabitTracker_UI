//
//  BackgroundView.swift
//  HabitTracker_UI
//
//  Created by Anmol Jain on 16/10/21.
//

import SwiftUI

struct BackgroundView: ViewModifier {
	
	private let bgColor: Color
	
	init(color: Color) {
		bgColor = color
	}
	
	func body(content: Content) -> some View {
		ZStack {
			bgColor
				.edgesIgnoringSafeArea(.all)
			content
		}
	}
}

extension View {
	func background(color: Color) -> some View {
		ModifiedContent(content: self, modifier: BackgroundView(color: color))
	}
}
