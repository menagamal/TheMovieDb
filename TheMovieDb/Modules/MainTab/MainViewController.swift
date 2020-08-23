//
//  MainViewController.swift
//  TheMovieDb
//
//  Created by Mena Gamal on 8/21/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//C10F00

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarItemsProperties()
        
    }
    
    private func setTabBarItemsProperties() {
        guard let first = (tabBar.items?[0]) else {
            return
        }
        guard let second = (tabBar.items?[1]) else {
            return
        }
        first.image = UIImage(named: "unmovie")?.withRenderingMode(.alwaysOriginal)
        first.selectedImage = UIImage(named: "movie")?.withRenderingMode(.alwaysOriginal)
        first.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Palette.slateGrey], for: .selected)
        first.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)

        second.image = UIImage(named: "unfav")?.withRenderingMode(.alwaysOriginal)
        second.selectedImage = UIImage(named: "selfav")?.withRenderingMode(.alwaysOriginal)
        second.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Palette.slateGrey], for: .selected)
        second.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)

    }
   
}
