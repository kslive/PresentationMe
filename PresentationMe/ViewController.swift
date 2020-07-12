//
//  ViewController.swift
//  PresentationMe
//
//  Created by Eugene Kiselev on 12.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
    }

    func startPresentation() {
        
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(
                withIdentifier: "PageViewController") as? PageViewController {
                present(pageViewController, animated: true)
            }
        }
    }
}

