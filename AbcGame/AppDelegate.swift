//
//  AppDelegate.swift
//  AbcGame
//
//  Created by Jamil on 14/8/26.
//

import UIKit
import Appodeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private struct AppodealConstants {
        //demo key
        //dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f
        //
        static let key: String = "57f00653f58feba4e79ff23f293413b0ba075d12f28799d6"
        static let adTypes: AppodealAdType = [.interstitial, .rewardedVideo]
        static let logLevel: APDLogLevel = .verbose
        static let testMode: Bool = false
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if isAppodealEnable{
            initializeAppodealSDK()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: Appodeal Initialization //isAppodealEnable
    private func initializeAppodealSDK() {
        Appodeal.setLogLevel(AppodealConstants.logLevel)
        Appodeal.setAutocache(true, types: AppodealConstants.adTypes)
        Appodeal.setTestingEnabled(AppodealConstants.testMode)
        Appodeal.initialize(withApiKey: AppodealConstants.key, types: AppodealConstants.adTypes)
    }
}


