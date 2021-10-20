//
//  HabitTracker_UIApp.swift
//  HabitTracker_UI
//
//  Created by Shubham on 07/10/21.
//

import SwiftUI

@main
struct HabitTrackerUIApp: App {

    // MARK: - variables
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // MARK: - views
    var body: some Scene {
        WindowGroup {
            ZStack {
                MainView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
    -> Bool {
        return true
    }
}
