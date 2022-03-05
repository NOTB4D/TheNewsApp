//
//  NewsModel.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation


enum News {

    enum Fetch {

        struct Request {
            let country: String
        }

        struct Response {
            let news: [Article]
        }

        struct ViewModel {
            let news: [News.Fetch.ViewModel.New]

            struct New {
                let date: String?
                let title: String?
                let image: String?
            }
        }
    }
}
