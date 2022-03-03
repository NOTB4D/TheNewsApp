//
//  NewsListInteractor.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation
import Alamofire

class NewsListInteractor: NewsListInteractorProtocol, NewsDataStore{
    
    var presenter: NewsListPresenterProtocol?
    var worker: NewsWorkingLogic
    var news :[Article]?
    
    init(worker: NewsWorkingLogic) {
        self.worker = worker
    }
    
    func viewDidLoad() {
        fetchNews(request: News.Fetch.Request(country: "tr"))
    }
    
    func fetchNews(request: News.Fetch.Request){
        worker.getNews(request: NewsList.Request(country: request.country)){ [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.news = response.articles
                guard let news = self.news else { return }
                self.presenter?.handeOutput(.showData(News.Fetch.Response(news: news)))
            case .failure(_):
                self.presenter?.handeOutput(.showEmptyData)
            }
        }
    }
    
}
