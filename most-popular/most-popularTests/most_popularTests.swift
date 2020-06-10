//
//  most_popularTests.swift
//  most-popularTests
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import XCTest
import Moya
@testable import most_popular
class MostpopularTests: XCTestCase {

    var articles: Articles?
    var articlesProvider: MoyaProvider<MostPopularAPI>?
    override func setUp() {
        articlesProvider = MoyaProvider<MostPopularAPI>()
    }

    func testCallArticlesApi() {
        callArticlesApi()
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(self.articles?.results?.isEmpty ?? true)
        } else {
            XCTFail("Delay interrupted")
        }
    }

    func callArticlesApi() {
        articlesProvider?.request(.viewd) { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
                    let articles = try moyaResponse.map(Articles.self)
                    self.articles = articles
                    XCTAssertFalse(self.articles?.results?.isEmpty ?? true)
                } catch {
                    XCTFail("maping fail")
                }
            case .failure:
               XCTFail("request fail")
            }
        }
    }
}
