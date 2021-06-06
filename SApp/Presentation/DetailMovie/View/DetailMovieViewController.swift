//
//  DetailMovieViewController.swift
//  SApp
//
//  Created by Yegor on 07.06.2021.
//

import UIKit
import SDWebImage

class DetailMovieViewController: UIViewController {
    
    var movie: Movie? = nil

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let m = movie { showMovieData(movie: m) }
    }
    
    
    func showMovieData(movie: Movie) {
        titleLabel?.text = movie.title
//        dateLabel?.text = viewModel.date
        overviewLabel?.text = movie.overview
        
        if let movieImageUrl = movie.movieImageUrl {
            if let url = NetworkHelper.getUrlImagesMovies(nameImage: movieImageUrl) {
                movieImageView.sd_setImage(with: url)
            }
        }
    }

}
