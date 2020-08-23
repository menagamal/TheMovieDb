//
//  AppDelegate.swift
//  TheMovieDb
//
//  Created by Mena Gamal on 8/21/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import Network
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CacheHandler.shared.fetchCache()
        reachibity()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func reachibity() {
           if #available(iOS 12.0, *) {
               let monitor = NWPathMonitor()
               monitor.pathUpdateHandler = { path in
                   // self.showInternetStatus(path.status == .satisfied)
                   NotificationCenter.default.post(name: .onRechabilityChanged, object: path.status == .satisfied)
               }
               let queue = DispatchQueue(label: "Monitor")
               monitor.start(queue: queue)
           } else {
               // Fallback on earlier versions
           }
       }
   

}

