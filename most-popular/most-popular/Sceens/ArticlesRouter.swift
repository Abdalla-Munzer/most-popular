//
//  ArticlesRouter.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.

import UIKit

final class ArticlesRouterImplementation: ArticlesStorePassing {

    var dataStore: ArticlesDataStore?

    fileprivate weak var viewController: ArticlesViewController?

    init(viewController: ArticlesViewController) {
        self.viewController = viewController
    }
}
// MARK: - ArticlesRouter
extension ArticlesRouterImplementation: ArticlesRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
