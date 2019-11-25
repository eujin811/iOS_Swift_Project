//
//  AppDelegate.swift
//  ViewController1125
//
//  Created by YoujinMac on 2019/11/25.
//  Copyright © 2019 YoujinMac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 13, *){
            
        } else{
          window = UIWindow(frame: UIScreen.main.bounds)
            window?.backgroundColor = .systemBackground
            window?.rootViewController = ViewController()
            window?.makeKeyAndVisible()
            
        }
       
        return true
    }




}

