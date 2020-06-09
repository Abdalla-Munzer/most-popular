//
//  ArticlesPresenter.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.

final class ArticlesPresenter {
    weak private var output: ArticlesPresenterOutput!

    init(output: ArticlesPresenterOutput) {
        self.output = output
    }
}

// MARK: - ArticlesPresenterInput
extension ArticlesPresenter: ArticlesPresenterInput {
    func getMostPopularArticlesSuccess(articles: Articles?) {
        output.getMostPopularArticlesSuccess(articles: articles)
    }

    func getMostPopularArticlesFailed(error: Error?) {
        output.getMostPopularArticlesFailed(error: error)
    }
}
