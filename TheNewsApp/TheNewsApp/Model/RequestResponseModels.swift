//
//  RequestResponseModels.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation

// MARK: - News
struct NewsList: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?

    struct Request: Encodable {
        /**
         https://newsapi.org/docs/endpoints/top-headlines
         Can be fill according to documentation. I just added country statically
         */
        let country: String

        init(country: String) {
            self.country = country
        }
    }
}

// MARK: - Article
struct Article: Decodable {
    let source: Source?
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Decodable {
    let sourceId: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case sourceId = "id"
        case name
    }
}

