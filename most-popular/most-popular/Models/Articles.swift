//
//  Articles.swift
//  most-popular
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import Foundation
// MARK: - Articles
struct Articles: Codable, Configurable {
    let status, copyright: String?
    let numResults: Int?
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable, Configurable {
    let uri: String?
    let url: String?
    let articlesID, assetID: Int?
    let source: String?
    let publishedDate, updated, section: String?
    let subsection: String?
    let nytdsection, adxKeywords: String?
    let byline: String?
    let type: String?
    let title, abstract: String?
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    let media: [Media]?
    let etaID: Int?

    enum CodingKeys: String, CodingKey {
        case uri, url
        case articlesID = "id"
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let type: String?
    let subtype: String?
    let caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: String?
    let height, width: Int?
}
