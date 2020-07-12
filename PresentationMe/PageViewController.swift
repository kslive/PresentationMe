//
//  PageViewController.swift
//  PresentationMe
//
//  Created by Eugene Kiselev on 12.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    let presentScreenContent = ["hello, my name is Eugene",
                                "i'm a iOS-developer",
                                "every day i study in this direction",
                                "therefore I am open to interesting projects"]
    let emojiArray = ["✋🏽",
                     "🦾",
                     "👨🏽‍💻",
                     "🤷🏽"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController],
                               direction: .forward,
                               animated: true)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 && index < presentScreenContent.count,
            let contentViewController = storyboard?.instantiateViewController(
                withIdentifier: "ContentViewController") as? ContentViewController
            else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        return contentViewController
    }

}
