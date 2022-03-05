//
//  NewsDetailInteractor.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 4.03.2022.
//

import Foundation

class NewsDetailInteractor: NewsDetailInteractorProtocol, NewsDetailDataStoreProtocol{

    var news: Article?
    var presenter : NewsDetailPresenterProtocol?
    
    func viewDidLoad(request: NewsDetail.Fetch.Request) {
        guard let new = news else {return}
        self.presenter?.handleOutput(.showNews(response:.init(new: new)))
    }
}
