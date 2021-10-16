//
//  OnboardingView.swift
//  HabitTracker_UI
//
//  Created by Shubham on 08/10/21.
//

import SwiftUI

struct OnboardingView: View {
	@State private var currentPageIndex: Int = 0
	@State private var direction: UIPageViewController.NavigationDirection = .forward
	
	var subviews = [
		UIHostingController(
			rootView: OnboardingPage(
				withImage: "articles",
				heading: "Feature 1 Heading",
				and: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
			)
		),
		UIHostingController(
			rootView: OnboardingPage(
				withImage: "discuss-1",
				heading: "Feature 2 Heading",
				and: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
			)
		),
		UIHostingController(
			rootView: OnboardingPage(
				withImage: "build-1",
				heading: "Feature 3 Heading",
				and: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
			)
		),
		UIHostingController(
			rootView: OnboardingPage(
				withImage: "class",
				heading: "Feature 4 Heading",
				and: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
			)
		)
	]
	
	var completion: () -> Void
	
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Spacer()
				Button(action: {
					self.finishOnboarding()
				}) {
					Text(NSLocalizedString("Skip", comment: "Skip"))
						.font(TypefaceOne.regular.font(size: 16))
						.padding([.trailing, .top])
				}
				.disabled(currentPageIndex == subviews.count - 1)
				.opacity(currentPageIndex != subviews.count - 1 ? 1 : 0)
			}
			
			PageViewController(
				currentPageIndex: $currentPageIndex,
				direction: $direction,
				viewControllers: subviews
			)
			
			VStack(spacing: 10) {
				HStack {
					Spacer()
					PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
					Spacer()
				}
				
				HStack {
					if currentPageIndex != 0 {
						Button(action: {
							if currentPageIndex > 0 {
								withAnimation {
									currentPageIndex -= 1
								}
							}
						}) {
							Image(systemName: "arrow.left.square.fill")
								.font(.system(size: 48))
								.foregroundColor(ColorPalette.accent.color)
								.flipsForRightToLeftLayoutDirection(true)
						}
					}
					
					Spacer()
					
					Button(action: {
						if currentPageIndex < subviews.count - 1 {
							withAnimation {
								currentPageIndex += 1
							}
						} else {
							finishOnboarding()
						}
					}) {
						Image(systemName: "arrow.right.square.fill")
							.font(.system(size: 48))
							.foregroundColor(ColorPalette.accent.color)
							.flipsForRightToLeftLayoutDirection(true)
					}
				}
				.padding(30)
			}
		}
	}
	
	private func finishOnboarding() {
		DispatchQueue.main.async {
			DefaultsManager.shared.isOnboardingComplete = true
			completion()
		}
	}
}

struct PageViewController: UIViewControllerRepresentable {
	@Binding var currentPageIndex: Int
	@Binding var direction: UIPageViewController.NavigationDirection
	var viewControllers: [UIViewController]
	
	func makeUIViewController(context: Context) -> UIPageViewController {
		let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
		
		pageViewController.delegate = context.coordinator
		pageViewController.dataSource = context.coordinator
		
		return pageViewController
	}
	
	func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
		uiViewController.setViewControllers([viewControllers[currentPageIndex]], direction: direction, animated: true)
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
}

extension PageViewController {
	class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
		var parent: PageViewController
		
		init(_ pageViewController: PageViewController) {
			self.parent = pageViewController
		}
		
		func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
			guard let index = parent.viewControllers.firstIndex(of: viewController) else {
				return nil
			}
			
			if index == 0 {
				return nil
			}
			
			return parent.viewControllers[index - 1]
		}
		
		func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
			guard let index = parent.viewControllers.firstIndex(of: viewController) else {
				return nil
			}
			
			if index + 1 == parent.viewControllers.count {
				return nil
			}
			
			return parent.viewControllers[index + 1]
		}
		
		func pageViewController(
			_ pageViewController: UIPageViewController,
			didFinishAnimating finished: Bool,
			previousViewControllers: [UIViewController],
			transitionCompleted completed: Bool
		) {
			if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = parent.viewControllers.firstIndex(of: visibleViewController) {
				parent.currentPageIndex = index
			}
		}
	}
}


struct PageControl: UIViewRepresentable {
	var numberOfPages: Int
	@Binding var currentPageIndex: Int
	
	func makeUIView(context: Context) -> UIPageControl {
		let control = UIPageControl()
		control.numberOfPages = numberOfPages
		control.currentPageIndicatorTintColor = ColorPalette.accent.uiColor
		control.pageIndicatorTintColor = UIColor.black
		
		return control
	}
	
	func updateUIView(_ uiView: UIPageControl, context: Context) {
		uiView.currentPage = currentPageIndex
	}
}


struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView {}
	}
}
