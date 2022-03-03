//
//  NewsListContracts.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation
//MARK: NetworkWorker
protocol NewsWorkingLogic: AnyObject {
    func getNews(request: NewsList.Request, completion: @escaping ((Result<NewsList, Error>) -> Void))
}



// MARK: INTERACTOR
protocol NewsListInteractorProtocol {
    func viewDidLoad()
}

enum NewsListInteractorOutput {
    case showData(News.Fetch.Response)
    case showEmptyData
    
}

protocol NewsDataStore: AnyObject {
    var news: [Article]? { get }
}

// MARK: Presenter
protocol NewsListPresenterProtocol {
    func handeOutput(_ output: NewsListInteractorOutput)
}

enum NewsListPresenterOutput {
    case showNewsList(News.Fetch.ViewModel)
    case showEmptyList
}

protocol NewsListViewProtocol: NSObject{
    func handleOutput (_ output: NewsListPresenterOutput)
}
// MARK: Router

protocol NewsListRoutingProtocol   {
    func navigate(to route: NewsListRoute)
}

enum NewsListRoute {
    case showNewsDetail(index: Int)
}
