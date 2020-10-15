//
//  AppDelegate.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate
{
    var appState: AppState = .running
    var context: Context = createContext()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
    {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)
    {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
//    func applicationWillTerminate(_ application: UIApplication) {
//
//    }
//
//    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
//
//    }
//
//    func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
//
//    }
//
//    func application(_ application: UIApplication, userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShare.Metadata) {
//
//    }
}
