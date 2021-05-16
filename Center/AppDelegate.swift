//
//  AppDelegate.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import CloudKit

class AppDelegate: UIResponder, UIApplicationDelegate
{
    static var shared: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    var appMachine: AppStateMachine = .init(current: .background)
    var context: Context = createContext()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        appMachine.transition(to: .foreground)
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
}
