//
//  ArticlesInteractor.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.

final class ArticlesInteractor {
	// MARK: - Properties
	var output: ArticlesInteractorOutput!

    init(output: ArticlesInteractorOutput) {
        self.output = output
    }
}

// MARK: - ArticlesInteractorInput
extension ArticlesInteractor: ArticlesInteractorInput {
	func viewDidLoad() {

    }
    func viewWillAppear(){
        
    }
    func viewWillDisappear(){
        
    }

}

// MARK: - Private
private extension ArticlesInteractor {

}
