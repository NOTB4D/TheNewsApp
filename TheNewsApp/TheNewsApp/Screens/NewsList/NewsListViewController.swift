//
//  NewsListViewController.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import UIKit
import CoreAudio

class NewsListViewController: UIViewController, NewsListViewProtocol {

    @IBOutlet weak var NewsListTableView: UITableView!{
        didSet{
            NewsListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
        }
    }
    

    var interactor : NewsListInteractorProtocol?
    
    var viewModel: News.Fetch.ViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        guard let model = self.viewModel?.news[indexPath.row]  else {
            return UITableViewCell()
        }
        cell.textLabel?.text = model.title
        return cell
    }
}

