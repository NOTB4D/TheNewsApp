//
//  NewsTableViewCell.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: News.Fetch.ViewModel.New){
       
        labelDate.text = viewModel.date
        labelNews.text = viewModel.title
        guard let image = viewModel.image else { return }
        newsImageView.sd_setImage(with: URL(string: image))
    }
}
