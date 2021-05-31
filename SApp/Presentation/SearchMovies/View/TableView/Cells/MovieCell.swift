//
//  MovieViewCell.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import UIKit

class MovieCell: UITableViewCell {
    
    private var viewModel: MoviesCellViewModel!
    
    static let cellIdentifier = String(describing: MovieCell.self)
    static let height = CGFloat(130)
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var overviewLabel: UILabel!
    @IBOutlet private var movieImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(viewModel: MoviesCellViewModel) {
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        overviewLabel.text = viewModel.overview
    }

//    private func updatePosterImage(width: Int) {
//        posterImageView.image = nil
//        guard let posterImagePath = viewModel.posterImagePath else { return }
//
//        imageLoadTask = posterImagesRepository?.fetchImage(with: posterImagePath, width: width) { [weak self] result in
//            guard let self = self else { return }
//            guard self.viewModel.posterImagePath == posterImagePath else { return }
//            if case let .success(data) = result {
//                self.posterImageView.image = UIImage(data: data)
//            }
//            self.imageLoadTask = nil
//        }
//    }
    
}
