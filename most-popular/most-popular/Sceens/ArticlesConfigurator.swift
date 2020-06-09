//
//  ArticlesConfigurator.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.

import Foundation

final class ArticlesConfiguratorImplementation: ArticlesConfigurator {

    func configureWith(viewController: ArticlesViewController) {
        let router = ArticlesRouterImplementation(viewController: viewController)

        let presenter = ArticlesPresenter(output: viewController)

        let interactor = ArticlesInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
