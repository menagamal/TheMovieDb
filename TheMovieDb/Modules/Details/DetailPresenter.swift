//
//  DetailPresenter.swift
//  TheMovieDb
//
//  Created Mena Gamal on 8/22/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailPresenter: BasePresenter,DetailPresenterProtocol {
    
    weak internal var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    private let router: DetailRouterProtocol
    private var dataSource:SimilarCellDataSource?
    private var movie:Movie?
    init(view: DetailViewProtocol, interactor: DetailInteractorInputProtocol?, router: DetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func loadMovieDetails() {
        self.baseView?.showLoadingIndicator()
        interactor?.loadMovieDetails()
    }
    
    func rateMovie(rating: Double) {
        self.baseView?.showLoadingIndicator()
        interactor?.rateMovie(rate: rating)
    }
    
    func toggleFavouirte() {
        guard let movie = self.movie else {
            return
        }
        interactor?.toggleFavourte(movie:movie)
    }
    func isFavourite() -> Bool {
        return interactor?.isFavourite() ?? false
    }
}
extension DetailPresenter: DetailInteractorOutputProtocol {
    func didRateMovie() {
        self.baseView?.hideLoadingIndicator()
        self.view?.didRateMovie()
    }
    
    func didFetchMovieDetails(movie: MovieDetailsResponse) {
        self.baseView?.hideLoadingIndicator()
        guard let view = view else{
            return
        }
        view.labelTitle.text = movie.original_title ?? ""
        view.labelRelease.text = movie.release_date ?? ""
        view.labelRate.text = "\(movie.vote_average!)"
        let genres = movie.genres?.map({$0.name ?? "" })
        view.labelGenres.text = genres?.description ?? ""
        view.labelOverview.text = movie.overview ?? ""
        view.ratingView.rating = Double(movie.vote_average!/2)
        if !movie.base64.isEmpty {
            let dataDecoded : Data = Data(base64Encoded: movie.base64, options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            view.posterImageView.image  = decodedimage
        } else if let img = movie.poster_path {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500\(img)"){
                view.posterImageView.sd_setImage(with: url) { (img, error, _, _) in
                    if error == nil {
                        let imageData:Data = img!.pngData()!
                        let strBase64:String = imageData.base64EncodedString(options: .lineLength64Characters)
                        movie.base64 = strBase64
                        self.movie = Movie(obj: movie)
                    }
                }
            }
        }
        
        self.baseView?.showLoadingIndicator()
        self.interactor?.loadSimilarMovies(to: movie.id!)
    }
    
    func didSimilarMovies(movies: [Movie]) {
        self.baseView?.hideLoadingIndicator()
        guard let view = view else {
            return
        }
        dataSource = SimilarCellDataSource(collection: view.similarCollection, delegate: self, movies: movies)
    }
    
}
extension DetailPresenter:MovieCellDelegate{
    func didSelect(movie: Movie) {
        router.showDetails(movie: movie)
    }
}