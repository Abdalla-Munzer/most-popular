//
//  ArticlesViewController.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.

import UIKit

final class ArticlesViewController: UIViewController {
    
    // MARK: - Properties
    var configurator: ArticlesConfigurator! {
        didSet {
            configurator.configureWith(viewController: self)
        }
    }
	var output: ArticlesViewOutput!
	var router: ArticlesRouter!

}

// MARK: - View lifecycle
extension ArticlesViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewDidLoad()
	}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue, sender: sender)
    }

}

extension ArticlesViewController {

}

// MARK: - Private
private extension ArticlesViewController {
}

// MARK: - ArticlesPresenterOutput
extension ArticlesViewController: ArticlesPresenterOutput {

}
