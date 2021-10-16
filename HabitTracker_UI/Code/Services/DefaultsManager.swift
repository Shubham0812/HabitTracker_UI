//
//  DefaultsManager.swift
//  HabitTracker_UI
//
//  Created by Shubham on 08/10/21.
//

import SwiftUI

struct DefaultsManager {
	static var shared = DefaultsManager()
	
	private init() {}
	
	//First way
	var isOnboardingComplete: Bool {
		get {
			UserDefaults.standard.bool(forKey: DefaultsManager.Keys.isOnboardingComplete.rawValue)
		}
		set {
			UserDefaults.standard.set(newValue, forKey: DefaultsManager.Keys.isOnboardingComplete.rawValue)
		}
	}
	
	
    //Second Way
	func save<T>(_ value: T, at key: Keys) {
		UserDefaults.standard.set(value, forKey: key.rawValue)
	}
	
	func get<T>(from key: Keys) -> T? {
		UserDefaults.standard.object(forKey: key.rawValue) as? T
	}
	
	//Third Way
	// Use AppStorage instead
}

// MARK: - DefaultsManager Keys
extension DefaultsManager {
	enum Keys: String {
		case username = "USERNAME"
		case isOnboardingComplete = "IS_ONBOARDING_COMPLETE"
	}
}
