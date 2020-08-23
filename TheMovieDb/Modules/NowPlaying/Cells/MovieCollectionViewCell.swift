//
//  MovieCollectionViewCell.swift
//  TheMovieDb
//
//  Created by Mena Gamal on 8/22/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    func setDetails(movie:Movie) {
        if !movie.base64.isEmpty {
            let dataDecoded : Data = Data(base64Encoded: movie.base64, options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            movieImageView.image  = decodedimage
        } else if let img = movie.poster_path {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500\(img)"){
                movieImageView.sd_setImage(with: url, completed: nil)
            }
        }
        
        
        
        if let title = movie.title { labelTitle.text = title }
        if let rate = movie.vote_average { labelRate.text = "\(rate)"}
        
    }

}
