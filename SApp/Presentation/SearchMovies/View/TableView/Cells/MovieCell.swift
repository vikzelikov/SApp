//
//  MovieViewCell.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    
    private var viewModel: MoviesCellViewModel!
    
    static let cellIdentifier = String(describing: MovieCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(viewModel: MoviesCellViewModel) {
        self.viewModel = viewModel

        titleLabel?.text = viewModel.title
        dateLabel?.text = viewModel.date
        overviewLabel?.text = viewModel.overview
        
        if let movieImageUrl = viewModel.movieImageUrl {
            if let url = NetworkHelper.getUrlImagesMovies(nameImage: movieImageUrl) {
                movieImageView.sd_setImage(with: url)
            }
        }
    }

}
