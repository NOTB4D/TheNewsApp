//
//  NewsListViewController.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import UIKit
import CoreAudio

class NewsListViewController: UIViewController, NewsListViewProtocol {

    @IBOutlet weak var NewsListTableView: UITableView!
    

    var interactor : NewsListInteractorProtocol?
    var router : NewsListRoutingProtocol?
    var viewModel: News.Fetch.ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
        NewsListTableView.registerNib(NewsTableViewCell.self, bundle: .main)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

    func handleOutput(_ output: NewsListPresenterOutput) {
        switch output {
        case .showNewsList(let news):
            self.viewModel = news
            DispatchQueue.main.async {
                self.NewsListTableView.reloadData()
            }
        case .showEmptyList:
            break
        }
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

