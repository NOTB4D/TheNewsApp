//
//  NewsDetailBuilder.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 4.03.2022.
//

import Foundation
import UIKit

class NewsDetailBuilder {
    static func build() -> NewsDetailViewController {
        let storyboard = UIStoryboard (name: "NewsDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetail") as! NewsDetailViewController
        let interactor = NewsDetailInteractor()
        let presenter = NewsDetailPresenter()
        let router = NewsDetailRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
