//
//  AppTarget.swift
//  Coins
//
//  Created by Mena Gamal on 7/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import Moya


enum AppTarget {
    case requestSessionId
    case rating(id:Int,rating:Double)
    case fetchMovieDetails(id:Int)
    case fetchNowPlaying
    case similarMovies(id:Int)
}

extension AppTarget: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: BaseConstant.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .requestSessionId:
            return AppTargetConstant.EndPoint.session
        case .rating(let id, _):
            return "movie/\(id)/rating"
        case .fetchMovieDetails(let id):
            return "movie/\(id)"
        case .fetchNowPlaying:
            return AppTargetConstant.EndPoint.fetchNowPlaying
        case .similarMovies(let id ):
            return "movie/\(id)/\(AppTargetConstant.EndPoint.sim)"
            
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method{
        switch self {
        case .rating:
            return .post
        default:
            return .get
        }
    }
    
    var task: Task {
        
        switch self {
        case .requestSessionId:
            let parameters: [String: Any] = [
                AppTargetConstant.Parameters.apiKey: BaseConstant.apiKey
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .similarMovies:
            return .requestPlain
        case .rating(_, let rating):
            let parameters: [String: Any] = [
                AppTargetConstant.Parameters.apiKey: BaseConstant.apiKey,
                AppTargetConstant.Parameters.guestSessionId: BaseConstant.sessionId
            ]
            let bodyparameters: [String: Any] = [AppTargetConstant.Parameters.value: rating
            ]
            return .requestCompositeParameters(bodyParameters: bodyparameters, bodyEncoding: JSONEncoding.default, urlParameters: parameters)
        case .fetchNowPlaying,.fetchMovieDetails:
            let parameters: [String: Any] = [AppTargetConstant.Parameters.apiKey: BaseConstant.apiKey,
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String : String]? {
        let headers: [String: String] = [
            BaseConstant.HTTPHeaderField.Accept.rawValue: BaseConstant.ContentType.json.rawValue,
            BaseConstant.HTTPHeaderField.ContentType.rawValue: BaseConstant.ContentType.json.rawValue,
        ]
        return headers
    }
    
}
