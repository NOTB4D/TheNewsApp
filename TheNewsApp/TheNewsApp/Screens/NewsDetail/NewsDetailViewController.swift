//
//  NewsDetailViewController.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 4.03.2022.
//

import UIKit
import ViewAnimator
import SDWebImage

class NewsDetailViewController: UIViewController, NewsDetailViewProtocol {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelNewsDetail: UITextView!
    
    var interactor: NewsDetailInteractorProtocol?
    var router: NewsDetailRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad(request: NewsDetail.Fetch.Request())
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.image.animate(animations: [AnimationType.zoom(scale: 4)], duration: 2)
    }
    
    func handleOutput(_ output: NewsDetailPresenterOutput) {
        switch output {
        case .showNews(let viewModel):
            self.labelDate.text = viewModel.publishDate
            self.labelNewsDetail.text = viewModel.detailDescription
            self.image.sd_setImage(with: URL(string: viewModel.image))
        }
    }
    
}
