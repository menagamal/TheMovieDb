//
//  DetailConfig.swift
//  TheMovieDb
//
//  Created Mena Gamal on 8/22/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class DetailConfig: BaseConfig{
    func createModule(view: DetailViewController,movie:Movie) {
        
        let interactor: DetailInteractor = DetailInteractor(movie: movie)
        let router: DetailRouter = DetailRouter()
        
        let presenter: DetailPresenter = DetailPresenter(view: view, interactor: interactor, router: router)
        
        router.view = view
        interactor.basePresenter = handleBasePresenter(baseView: view)
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.baseView = view
    }
}
