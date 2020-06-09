//
//  UIViewControllerExtenstions.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import UIKit
extension UIViewController {
    func showAlertWith(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        UIApplication.shared.keyWindow?.rootViewController?.topMostViewController().present(alert, animated: true, completion: nil)
    }

    func topMostViewController() -> UIViewController {
        guard let presentedVC = self.presentedViewController else {
            return self
        }
        if let navigation = presentedVC as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? self
        }
        if let tab = presentedVC as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return presentedVC.topMostViewController()
    }
}
