//
//  NewsListRouter.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 4.03.2022.
//

import Foundation

class NewsListRouter: NewsListRouterProtocol {
    
    var dataStore: NewsListDataStoreProcotol?
    weak var viewController: NewsListViewController?

    
    func navigate(to route: NewsListRoute) {
        switch route {
        case .showNewsDetail(let index):
            if let news = dataStore?.dataStore {
                let new = news[index]
                
                let destinationVC = NewsDetailBuilder.build()
                destinationVC.router?.dataStore?.news = new
                self.viewController?.navigationController?.show(destinationVC, sender: true)
            }
        }
    }
}

