//
//  AppDelegate.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Firebase
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var homeCoordinator: HomeCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        homeCoordinator = HomeCoordinator(window: window)
        homeCoordinator?.start()

        return true
    }
}
