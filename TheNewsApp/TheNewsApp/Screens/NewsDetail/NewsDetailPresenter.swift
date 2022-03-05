//
//  NewsDetailPresenter.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 4.03.2022.
//

import Foundation

class NewsDetailPresenter: NewsDetailPresenterProtocol {

    weak var viewController: NewsDetailViewProtocol?
    
    func handleOutput(_ output: NewsDetailInteractorOutput) {
        switch output {
        case .showNews(let response):
            viewController?.handleOutput(.showNews(viewModel: NewsDetail.Fetch.ViewModel(
                image: response.new?.urlToImage ?? "",
                title: response.new?.title ?? "",
                detailDescription: response.new?.articleDescription ?? "",
                publishDate: response.new?.publishedAt ?? ""
            )))
        }
    }
    
}
