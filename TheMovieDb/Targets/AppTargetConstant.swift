//
//  AppTargetConstant.swift
//  Coins
//
//  Created by Mena Gamal on 7/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

enum AppTargetConstant {
    
    
    enum EndPoint {
        
        static let fetchNowPlaying = "movie/now_playing"
        static let sim = "movie/similar"
        static let session = "authentication/guest_session/new"
    }
    
    enum Parameters {
        static let apiKey = "api_key"
        static let value = "value"
        static let guestSessionId = "guest_session_id"
    }
    
    enum Constants {
        static let desc = "desc"
        static let stars = "stars"
    }
    
    
}
