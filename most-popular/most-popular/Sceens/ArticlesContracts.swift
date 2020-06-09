//
//  ArticlesContracts.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.

import Foundation
import UIKit

protocol ArticlesConfigurator {
    func configureWith(viewController: ArticlesViewController)
}

protocol ArticlesRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

// MARK: - DataStore
protocol ArticlesDataStore {

}

protocol ArticlesStorePassing {

}

// MARK: - Outputs
protocol ArticlesViewOutput : AnyObject{
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
}


protocol ArticlesInteractorOutput : AnyObject{

}

protocol ArticlesPresenterOutput : AnyObject{

}

// MARK: - Inputs
protocol ArticlesViewInput: ArticlesPresenterOutput {

}

protocol ArticlesInteractorInput: ArticlesViewOutput {

}

protocol ArticlesPresenterInput: ArticlesInteractorOutput {

}
