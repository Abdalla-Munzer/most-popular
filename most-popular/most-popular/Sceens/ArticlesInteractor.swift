//
//  ArticlesInteractor.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.
import Moya

final class ArticlesInteractor {
	// MARK: - Properties
	var output: ArticlesInteractorOutput!
    let articlesProvider = MoyaProvider<MostPopularAPI>()
    init(output: ArticlesInteractorOutput) {
        self.output = output
    }
}

// MARK: - ArticlesInteractorInput
extension ArticlesInteractor: ArticlesInteractorInput {
    func getMostPopularArticles() {
        articlesProvider.request(.viewd) { (result) in
            switch result {
            case let .success(moyaResponse):
                self.output.getMostPopularArticlesSuccess(response: moyaResponse)
            case let .failure(error):
                self.output.getMostPopularArticlesFailed(error: error)
            }
        }
    }

    func viewDidLoad() {
        getMostPopularArticles()
    }
    func viewWillAppear() {

    }
    func viewWillDisappear() {

    }

}

// MARK: - Private
private extension ArticlesInteractor {

}
