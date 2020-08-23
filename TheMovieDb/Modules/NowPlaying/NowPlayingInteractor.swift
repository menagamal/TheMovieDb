//
//  NowPlayingInteractor.swift
//  TheMovieDb
//
//  Created Mena Gamal on 8/22/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class NowPlayingInteractor: BaseInteractor<AppTarget>,NowPlayingInteractorInputProtocol {
    
    weak var presenter: NowPlayingInteractorOutputProtocol?
    
    func fetchNowPlayingMovies() {
        request(targetType:.fetchNowPlaying) { [weak self] (response: NowPlayingResponse) in
            guard let strongSelf = self else { return }
            guard let movies = response.results else { return }
            
            // SORTED ALPHABITACALLY
            let sorted = movies.sorted(by: { $0.original_title! > $1.original_title! })
            
            strongSelf.presenter?.didLoadNowPlayingMovies(movies: sorted)
        }
    }
    
    func requestSessionId() {
        request(targetType: .requestSessionId) { [weak self] (response: RequestSessionIdResponse) in
            guard let strongSelf = self else { return }
            BaseConstant.sessionId = response.guest_session_id!
            strongSelf.presenter?.didRequestSession()
        }
    }
    
}
