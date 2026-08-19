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
        static let key: String = "dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f"
        static let adTypes: AppodealAdType = [.interstitial, .rewardedVideo, .banner, .nativeAd]
        static let logLevel: APDLogLevel = .debug
        static let testMode: Bool = true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if isAppodealEnable{
//            Appodeal.setAutocache(true, types: [.interstitial, .rewardedVideo])
//            Appodeal.setLogLevel(.verbose)//
//            Appodeal.initialize(withApiKey: "57f00653f58feba4e79ff23f293413b0ba075d12f28799d6",types: [.interstitial, .rewardedVideo])
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
    
    // MARK: Appodeal Initialization
    private func initializeAppodealSDK() {
        /// Custom settings
        // Appodeal.setFramework(.native, version: "1.0.0")
        // Appodeal.setTriggerPrecacheCallbacks(true)
        // Appodeal.setLocationTracking(true)
        // Appodeal.setEndpoint("https://example.com/api")
        // let endpoint = Appodeal.getEndpoint()
        // Appodeal.setBidonEndpoint("https://example.com/api")
        // let bidonEndpoint = Appodeal.getBidonEndpoint()
        Appodeal.setLogLevel(AppodealConstants.logLevel)
        Appodeal.setAutocache(true, types: AppodealConstants.adTypes)
        
        /// Test Mode
        Appodeal.setTestingEnabled(AppodealConstants.testMode)
        
        /// User Data
        // Appodeal.setUserId("userID")
        
        
        // Initialise Appodeal SDK
        Appodeal.setInitializationDelegate(self)
        Appodeal.initialize(withApiKey: AppodealConstants.key, types: AppodealConstants.adTypes)
    }
}

extension AppDelegate: AppodealInitializationDelegate {
    func appodealSDKDidInitialize() {
        //here you can do any additional actions
    }
}


