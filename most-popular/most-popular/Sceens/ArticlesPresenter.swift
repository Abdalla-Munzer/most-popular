//
//  ArticlesPresenter.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright (c) 2020 com.most-popular. All rights reserved.
import Moya
final class ArticlesPresenter {
    weak private var output: ArticlesPresenterOutput!

    init(output: ArticlesPresenterOutput) {
        self.output = output
    }
}

// MARK: - ArticlesPresenterInput
extension ArticlesPresenter: ArticlesPresenterInput {
    func getMostPopularArticlesSuccess(response: Response) {
        do {
            let articles = try response.map(Articles.self)
            output.getMostPopularArticlesSuccess(articles: articles)
        } catch {
            output.getMostPopularArticlesFailed(error: error)
        }
    }
    func getMostPopularArticlesFailed(error: Error?) {
        output.getMostPopularArticlesFailed(error: error)
    }
}
