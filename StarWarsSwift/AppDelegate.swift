//
//  AppDelegate.swift
//  StarWarsSwift
//
//  Created by Timple Soft on 11/5/15.
//  Copyright (c) 2015 TimpleSoft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static let LAST_SELECTED_CHARACTER_SECTION = "lastSelectedCharacterSection"
    static let LAST_SELECTED_CHARACTER_ROW = "lastSelectedCharacterRow"
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Cargamos las coordenadas el último personaje seleccionado si éxiste, si no ponemos uno por defecto
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if (userDefaults.objectForKey(AppDelegate.LAST_SELECTED_CHARACTER_SECTION) == nil){
            userDefaults.setObject(0, forKey: AppDelegate.LAST_SELECTED_CHARACTER_SECTION)
            userDefaults.setObject(0, forKey: AppDelegate.LAST_SELECTED_CHARACTER_ROW)
            userDefaults.synchronize()
        }
        
        let section = userDefaults.objectForKey(AppDelegate.LAST_SELECTED_CHARACTER_SECTION) as! Int
        let row = userDefaults.objectForKey(AppDelegate.LAST_SELECTED_CHARACTER_ROW) as! Int
        
        
        // Crear la window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Creamos una instacia del universo
        let universe = StarWarsUniverse()
        
        // Creamos los VC a mostrar
        var charVC : StarWarsCharacterViewController
        if section == StarWarsUniverse.IMPERIAL_SECTION{
            charVC = StarWarsCharacterViewController(model: universe.imperialAtIndex(row), nibName: "StarWarsCharacterViewController", bundle: nil)
        }else{
            charVC = StarWarsCharacterViewController(model: universe.rebelAtIndex(row), nibName: "StarWarsCharacterViewController", bundle: nil)
        }
        var universeVC = UniverseTableViewController(style: UITableViewStyle.Grouped)
        
        // Creamos el navigation
        var charNav = UINavigationController(rootViewController: charVC)
        var universeNav = UINavigationController(rootViewController: universeVC)
        
        // Creamos el combinador
        let splitVC = UISplitViewController()
        splitVC.viewControllers = [universeNav, charNav]
        
        // Asignamos los delegados
        splitVC.delegate = charVC
        universeVC.delegate = charVC
        
        // Lo asignamos como root
        window?.rootViewController = splitVC
            
        // Lo mostramos
        window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

