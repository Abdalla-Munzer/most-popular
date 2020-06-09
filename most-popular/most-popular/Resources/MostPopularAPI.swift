//
//  MostPopularAPI.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import Foundation
import Moya

public func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

public enum MostPopularAPI {
    case viewd
}

extension MostPopularAPI: TargetType {

    public var baseURL: URL { return URL(string: "https://api.nytimes.com")! }
    public var path: String {
        return "/svc/mostpopular/v2/viewed/7.json"
    }
    public var method: Moya.Method {
        return .get
    }
    public var task: Task {
        return .requestParameters(parameters: ["api-key": "0kG2RbAw0wrMKAUazu9TX10cYrUpu1Wz"], encoding: URLEncoding.default)
    }
    public var validationType: ValidationType {
        return .successCodes
    }

    public var sampleData: Data {
        return Data()
    }
    public var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
}
