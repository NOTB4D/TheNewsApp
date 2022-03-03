//
//  NewsListPresenter.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation

class NewsListPresenter : NewsListPresenterProtocol {

    
    weak var viewController: NewsListViewProtocol?
    
    func handeOutput(_ output: NewsListInteractorOutput) {
        switch output {
        case .showData(let response):
            var news: [News.Fetch.ViewModel.New] = []
            response.news.forEach{
                news.append(News.Fetch.ViewModel.New(date: $0.publishedAt,
                                                     title: $0.title,
                                                     image: $0.urlToImage))
            }
            viewController?.handleOutput(.showNewsList(News.Fetch.ViewModel(news: news)))
        case .showEmptyData:
            viewController?.handleOutput(.showEmptyList)
        }
    }
}
