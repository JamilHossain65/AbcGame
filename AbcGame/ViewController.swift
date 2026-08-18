//
//  ViewController.swift
//  AbcGame
//
//  Created by Jamil on 14/8/26.
//

import UIKit
import Appodeal

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegate
        Appodeal.setInterstitialDelegate(self)
        
        let demoButton = UIButton(type: .detailDisclosure)
        demoButton.frame = CGRectMake(100, 230, 60, 40)
        demoButton.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        view.addSubview(demoButton)
    }
    
    @objc func playAction(sender: UIButton) {
    
        Appodeal.showAd(AppodealShowStyle.interstitial, rootViewController: self)
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

