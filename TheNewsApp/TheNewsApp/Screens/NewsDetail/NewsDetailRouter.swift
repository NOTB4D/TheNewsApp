//
//  NewsDetailRouter.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 4.03.2022.
//

import Foundation

class NewsDetailRouter: NewsDetailRouterProtocol{
    weak var viewController: NewsDetailViewController?
    
    var dataStore: NewsDetailDataStoreProtocol?
    
    func navigate(to route: NewsDetailRoute) {
        switch route {
        case .showNewsList:
            viewController?.navigationController?.popViewController(animated: true)
        }
    }
}
