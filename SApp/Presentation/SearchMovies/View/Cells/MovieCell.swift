//
//  MovieViewCell.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import UIKit

class MovieCell: UITableViewCell {
    
    static let cellIdentifier = String(describing: MovieCell.self)
    
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

}
