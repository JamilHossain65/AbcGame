//
//  ViewController.swift
//  AbcGame
//
//  Created by Jamil on 14/8/26.
//

import UIKit
import Appodeal
//import GoogleMobileAds
import UserMessagingPlatform

class ViewController: UIViewController {
    //var interstitialAd: InterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isAppodealEnable{
            // set delegate
            Appodeal.setInterstitialDelegate(self)
        }

//        // Add this immediately after initializing the Mobile Ads SDK
//        let testDeviceIdentifiers = ["ca-app-pub-3940256099942544/4411468910"]
//        MobileAds.shared.requestConfiguration.testDeviceIdentifiers = testDeviceIdentifiers
        
        let demoButton = UIButton(type: .detailDisclosure)
        demoButton.frame = CGRectMake(100, 230, 60, 40)
        demoButton.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        view.addSubview(demoButton)
        
        let demoButton2 = UIButton(type: .detailDisclosure)
        demoButton2.frame = CGRectMake(100, 330, 60, 40)
        demoButton2.addTarget(self, action: #selector(playAction2), for: .touchUpInside)
        view.addSubview(demoButton2)
    }
    
    @objc func playAction(sender: UIButton) {
        if isAppodealEnable{
            //Appodeal.showAd(AppodealShowStyle.interstitial, rootViewController: self)
            
//            let placement = "placement",
//            Appodeal.isInitialized(for: .interstitial)
//            Appodeal.canShow(.interstitial, forPlacement: placement)
            
            //Appodeal.isInitialized(for: .interstitial)
            
            Appodeal.showAd(.interstitial, rootViewController: self)
        }
    }
    
    @objc func playAction2(sender: UIButton) {
        //showAdmobInterstitial(self)
    }
}


extension ViewController: AppodealInterstitialDelegate {

    // Method called if interstitial mediation failed
    func interstitialDidFailToLoadAd() {
        let alert = UIAlertController(title: "Error", message: "Fail to load.. ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Method called if interstitial mediation was success, but ready ad network can't show ad or
    // ad presentation was to frequently according your placement settings
    func interstitialDidFailToPresent() {
        let alert = UIAlertController(title: "Error", message: "Fail to show.. ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

/*
extension ViewController: FullScreenContentDelegate {
    func showAdmobInterstitial(_ viewController:UIViewController){
        //ca-app-pub-8007562169424853/2425812770
        let request = Request()
        InterstitialAd.load(with:"ca-app-pub-3940256099942544/4411468910", request: request) { ad, error in
            if let error = error {
                return print("Failed to load interstitial ad with error: \(error.localizedDescription)")
            }

            self.interstitialAd = ad
            self.interstitialAd?.fullScreenContentDelegate = self
            self.interstitialAd?.present(from: viewController)
            print("admobAdKey::")
        }
    }
}
*/

