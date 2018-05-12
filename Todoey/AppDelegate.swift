//
//  AppDelegate.swift
//  Todoey
//
//  Created by Jason Smith on 1/14/18.
//  Copyright © 2018 Jason Smith. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
            
        } catch {
            print("Error initialising new realm, \(error)")
        }
        return true
    }
}

