//
//  AppRouter.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation
import UIKit

class AppRouter {
    func start(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let newsListVC = NewsListBuilder.build()
        let navigationContoller = UINavigationController(rootViewController: newsListVC)
        
        navigationContoller.navigationBar.isHidden = true
        window.rootViewController = navigationContoller
        window.makeKeyAndVisible()
        window.windowScene = scene
        
        return window
    }
}
