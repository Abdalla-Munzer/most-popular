//
//  AppCoordinator.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import Foundation
import UIKit
protocol AppCoordinator {
    func start()
}
class AppCoordinatorImplementation {
    let window: UIWindow?
    init(window: UIWindow?) {
        self.window = window
    }
}
extension AppCoordinatorImplementation: AppCoordinator {
    func start() {
        guard let articlesViewController = ArticlesViewController.instantiateFromAppStoryboard(.articles) else { return }
        articlesViewController.configurator = ArticlesConfiguratorImplementation()
        let mainNavigation = addNavigationBarTo(viewController: articlesViewController)
        window?.rootViewController = mainNavigation
        window?.makeKeyAndVisible()
    }
    func addNavigationBarTo(viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }
}

enum AppStoryboard: String {
    case articles = "Articles"

    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    /**
     This function takes class name as argument and returns it’s instance.
     - parameter viewControllerClass: Class of UIViewController
     - Returns: Class instance.
     */
    func viewController< T: UIViewController>(viewControllerClass: T.Type) -> T? {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as? T
    }
    /**
     This function takes class name as argument and returns it’s instance.
     - parameter tabBarControllerClass: Class of UITabBarController
     - Returns: Class instance.
     */
    func tabBarController< T: UITabBarController>(viewControllerClass: T.Type) -> T? {
        let storyboardID = (viewControllerClass as UITabBarController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as? T
    }
}
/**
 This extension used to return UIViewController storyboardID, the storyboardID should be the same of the UIViewController class name.
 */
extension UIViewController {
    class var storyboardID: String {
        return String(describing: self)
    }
    /**
     To get instance from the needed ViewControllers
     - parameter appStoryboard: Storyboard that the needed ViewControllers init
     - Returns: Self refers to the type of the current "thing"
     */
    static func instantiateFromAppStoryboard(_ appStoryboard: AppStoryboard) -> Self? {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
extension UITabBarController {
    /**
     To get instance from the needed ViewControllers
     - parameter appStoryboard: Storyboard that the needed UITabBarController init
     - Returns: Self refers to the type of the current "thing"
     */
    static func instantiateTabFromAppStoryboard(appStoryboard: AppStoryboard) -> Self? {
        return appStoryboard.tabBarController(viewControllerClass: self)
    }
}
