//
//  NewsListViewController.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import UIKit
import ViewAnimator
import CoreAudio

class NewsListViewController: UIViewController, NewsListViewProtocol {
    
    @IBOutlet weak var NewsListTableView: UITableView!
    
    
    var interactor : NewsListInteractorProtocol?
    var router : NewsListRoutingProtocol?
    var viewModel: News.Fetch.ViewModel?
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
        NewsListTableView.registerNib(NewsTableViewCell.self, bundle: .main)
        
        refreshControl.addTarget(self, action: #selector(NewsListViewController.refresh), for: UIControl.Event.valueChanged)
        
        NewsListTableView.refreshControl = refreshControl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    @objc func refresh(){
        interactor?.viewDidLoad()
    }
    
    func handleOutput(_ output: NewsListPresenterOutput) {
        switch output {
        case .showNewsList(let news):
            self.viewModel = news
            DispatchQueue.main.async {
                self.NewsListTableView.reloadData()
                self.refreshControl.endRefreshing()
                self.animate()
            }
        case .showEmptyList:
            break
        }
    }
    
    func animate(){
        let animation = AnimationType.from(direction: .top, offset: 300)
        UIView.animate(views: self.NewsListTableView.visibleCells,
                       animations: [animation],
                       delay: 0,
                       duration: 2)
    }
    
}
extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.news.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: NewsTableViewCell.self, indexPath: indexPath)
        guard let model = self.viewModel?.news[indexPath.row]  else {
            return UITableViewCell()
        }
        cell.configure(viewModel: model)
        return cell
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigate(to: .showNewsDetail(index: indexPath.row))
        NewsListTableView.deselectRow(at: indexPath, animated: true)
        
    }
}

