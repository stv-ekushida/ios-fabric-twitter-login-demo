//
//  AppDelegate.swift
//  ios-fabric-twitter-demo
//
//  Created by Eiji Kushida on 2017/03/31.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Fabric.with([Twitter.self])
        return true
    }
}

