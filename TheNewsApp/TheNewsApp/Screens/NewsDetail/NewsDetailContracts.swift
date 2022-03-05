//
//  NewsDetailContracts.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 4.03.2022.
//

import Foundation

enum NewsDetailPresenterOutput{
    case showNews(viewModel: NewsDetail.Fetch.ViewModel)
}

protocol NewsDetailViewProtocol: NSObject {
    func handleOutput (_ output: NewsDetailPresenterOutput)
}

protocol NewsDetailInteractorProtocol {
    func viewDidLoad(request: NewsDetail.Fetch.Request)
}

enum NewsDetailRoute {
    case showNewsList
}

typealias NewsDetailRouterProtocol = NewsDetailRoutingProtocol & NewsDetailDataPasingProtocol

protocol NewsDetailDataStoreProtocol: AnyObject {
    var news: Article? { get set }
}

protocol NewsDetailDataPasingProtocol {
    var dataStore : NewsDetailDataStoreProtocol? {get}
}

protocol NewsDetailRoutingProtocol {
    func navigate(to route: NewsDetailRoute)
}

enum NewsDetailInteractorOutput{
    case showNews(response: NewsDetail.Fetch.Response)
}

protocol NewsDetailPresenterProtocol {
    func handleOutput(_ output: NewsDetailInteractorOutput)
}
