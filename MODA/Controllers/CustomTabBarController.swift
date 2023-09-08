//
//  CustomTabBarController.swift
//  MODA
//
//  Created by Kyle on 2023/09/06.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let scrollView = findScrollView(in: viewController.view) {
            let top = CGPoint(x: 0, y: -scrollView.contentInset.top)
            scrollView.setContentOffset(top, animated: true)
        }
    }
    
    func findScrollView(in view: UIView) -> UIScrollView? {
        for subview in view.subviews {
            if let scrollView = subview as? UIScrollView {
                return scrollView
            }
            if let found = findScrollView(in: subview) {
                return found
            }
        }
        return nil
    }
}

