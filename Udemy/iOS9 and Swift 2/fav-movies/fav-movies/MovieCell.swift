//
//  MovieCell.swift
//  fav-movies
//
//  Created by Ilya Shaisultanov on 1/13/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var movieImage: RoundedImage!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var movieURL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell (m: Movie) {
        movieImage.image = m.getMovieImage()
        movieTitle.text = m.title
        movieDesc.text = m.desc
        movieURL.text = m.url
    }
}
