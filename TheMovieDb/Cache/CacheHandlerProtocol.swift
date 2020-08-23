//
//  CacheHandlerProtocol.swift
//  GithubVIPER
//
//  Created by Mena Gamal on 8/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol CacheHandlerProtocol {
    func SaveData(object:MovieDetailsResponse) -> CacheResponse
    func loadAllCachedData() -> [MovieDetailsResponse]
    func deleteObject(object:MovieDetailsResponse) -> CacheResponse
    func fetchObject(with id:Int) -> MovieDetailsResponse?
    func clearAll()
}
