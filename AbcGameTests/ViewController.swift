//
//  ViewController.swift
//  AbcGame
//
//  Created by Jamil on 14/8/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let demoButton = UIButton(type: .detailDisclosure)
        demoButton.frame = CGRectMake(100, 230, 60, 40)
        demoButton.addTarget(self, action: #selector(playAction), for: .touchUpInside)
        view.addSubview(demoButton)
    }
    
    @objc func playAction(sender: UIButton) {
    
        let alert = UIAlertController(title: "Alert", message: "This is a test message.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            print("The OK alert occured")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

