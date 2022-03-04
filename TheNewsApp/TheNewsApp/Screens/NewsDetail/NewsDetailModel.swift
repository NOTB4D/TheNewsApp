//
//  NewsDetailModel.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 4.03.2022.
//

import Foundation

//swiftlint:disable nesting
enum NewsDetail {

    enum Fetch {

        struct Request {

        }

        struct Response {
            let new: Article?
        }

        struct ViewModel {
            var image: String
            var title: String
            var detailDescription: String
            var publishDate: String
        }
    }
}
//swiftlint:enable nesting
