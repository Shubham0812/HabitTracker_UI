//
//  LoaderView.swift
//  HabitTracker_UI
//
//  Created by Anmol Jain on 16/10/21.
//

import SwiftUI

struct LoaderView: View {
	@State private var animateTrimmedCircle: Bool = false
	@State private var animateInnerCircle: Bool = false
	
	var body: some View {
		VStack {
			ZStack {
				Circle()
					.frame(width: 30, height: 30)
					.foregroundColor(.black.opacity(0.1))
					.scaleEffect(animateInnerCircle ? 1 : 0.5)
					.animation(
						Animation.interpolatingSpring(stiffness: 170, damping: 20)
							.speed(1.5)
							.repeatForever(autoreverses: true)
					)
					.onAppear {
						self.animateInnerCircle.toggle()
					}
				
				ZStack {
					Circle()
						.trim(from: 3 / 4, to: 1)
						.stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
						.frame(width: 50, height: 50)
						.foregroundColor(ColorPalette.secondary.color)
					
					Circle()
						.trim(from: 3 / 4, to: 1)
						.stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
						.frame(width: 50, height: 50)
						.foregroundColor(ColorPalette.secondary.color)
						.rotationEffect(.degrees(-180))
				}
				.scaleEffect(animateTrimmedCircle ? 1 : 0.4)
				.rotationEffect(.degrees(animateTrimmedCircle ? 360 : 0))
				.animation(
					Animation.interpolatingSpring(stiffness: 180, damping: 20)
						.speed(1.5)
						.repeatForever(autoreverses: true)
				)
				.onAppear {
					self.animateTrimmedCircle.toggle()
				}
			}
			.padding(.bottom, 20)
		}
	}
}

struct LoaderView_Previews: PreviewProvider {
	static var previews: some View {
		LoaderView()
	}
}
