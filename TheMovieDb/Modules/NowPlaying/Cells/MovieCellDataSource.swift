//
//  MovieCellDataSource.swift
//  TheMovieDb
//
//  Created by Mena Gamal on 8/22/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit

class MovieCellDataSource: NSObject ,UICollectionViewDataSource{
    
    var collection:UICollectionView!
    var delegate:MovieCellDelegate?
    var movies = [Movie]()
    
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,delegate:MovieCellDelegate,movies:[Movie]) {
        super.init()
        
        
        self.movies = movies
        self.delegate = delegate
        self.collection = collection
        
        self.collection.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        self.collection.dataSource = self
        
        self.collection.delegate = self
        setupCollectionViewLayout()
        
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell",for: indexPath) as! MovieCollectionViewCell
        cell.setDetails(movie: movies[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(movie: movies[indexPath.row])
    }
    func setupCollectionViewLayout() {

        // Create a waterfall layout
        let layout = CHTCollectionViewWaterfallLayout()

        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 8.0
        layout.minimumInteritemSpacing = 8.0

        // Set the waterfall layout to your collection view
        self.collection.collectionViewLayout = layout
    }
    
}


extension MovieCellDataSource: CHTCollectionViewDelegateWaterfallLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountFor section: Int) -> Int {
        return 2
    }
    
}


protocol MovieCellDelegate {
    func didSelect(movie:Movie)
}
