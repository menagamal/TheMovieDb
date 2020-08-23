//
//  SimilarCellDataSource.swift
//  TheMovieDb
//
//  Created by Mena Gamal on 8/22/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit

class SimilarCellDataSource: NSObject ,UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
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
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
         
           let padding: CGFloat = 5
           let height:CGFloat = collectionView.frame.size.height - padding
        let collectionViewSize = collectionView.frame.size.width/2.5 - padding
           return CGSize(width: collectionViewSize, height: height)
           
       }
    
}
