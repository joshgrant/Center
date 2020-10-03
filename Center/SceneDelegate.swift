//
//  SceneDelegate.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    /// We need to get out of the "context" thing...
    /// and abstract it to the an environment or something like that...
    /// Also, it should be agnostic - core data v. disk should be the same, just
    /// a one line switch...
    //    let coreDataManager = CoreDataManager()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let scene = scene as? UIWindowScene else { return }
        
        //        let entity = Event(entity: Event.entity(), insertInto: coreDataManager.context)
        //        entity.title = Symbol(entity: Symbol.entity(), insertInto: coreDataManager.context)
        //        entity.title.stringValue = "Interesting"
        //        try! coreDataManager.context.save()
        let realmDataManager = RealmDataManager()
        
        realmDataManager.populateWithSampleData()
        
        let environment = RootEnvironment(dataManager: realmDataManager)
        let viewFactory = RootViewFactory(environment: environment)
        let root = RootViewController(viewFactory: viewFactory)
        
        let window = UIWindow(windowScene: scene)
        window.rootViewController = root
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene)
    {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene)
    {
        NotificationCenter.default.post(
            name: .sceneDidBecomeActive,
            object: nil,
            userInfo: ["scene" : scene])
    }
    
    func sceneWillResignActive(_ scene: UIScene)
    {
        NotificationCenter.default.post(
            name: .sceneWillResignActive,
            object: nil,
            userInfo: ["scene" : scene])
    }
    
    func sceneWillEnterForeground(_ scene: UIScene)
    {
        NotificationCenter.default.post(
            name: .sceneWillEnterForeground,
            object: nil,
            userInfo: ["scene" : scene])
    }
    
    func sceneDidEnterBackground(_ scene: UIScene)
    {
        NotificationCenter.default.post(
            name: .sceneDidEnterBackground,
            object: nil,
            userInfo: ["scene" : scene])
    }
}
