//
//  NewsListBuilder.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation
import UIKit

class NewsListBuilder {
    static func build() -> NewsListViewController {
        let storyboard = UIStoryboard (name: "NewsList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsList") as! NewsListViewController
        let interactor = NewsListInteractor(worker: Networker())
        let presenter = NewsListPresenter()
        let router = NewsListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
    
    deinit {
        print("MainView Builder Deinit oldu")
    }
}
