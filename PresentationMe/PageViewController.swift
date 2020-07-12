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
                                "every day i study and get better",
                                "now i am ready for interesting projects",
                                ""]
    let emojiArray = ["✋🏽",
                      "🦾",
                      "👨🏽‍💻",
                      "🤷🏽",
                      ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController],
                               direction: .forward,
                               animated: true)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            dismiss(animated: true)
            return nil
        }
        guard let contentViewController = storyboard?.instantiateViewController(
            withIdentifier: "ContentViewController") as? ContentViewController
            else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        return contentViewController
    }
}
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
                var pageNumber = (viewController as! ContentViewController).currentPage
                pageNumber += 1
                
                return showViewControllerAtIndex(pageNumber)
    }
}
