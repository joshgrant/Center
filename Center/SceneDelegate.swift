//
//  SceneDelegate.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    /// We need to get out of the "context" thing...
    /// and abstract it to the an environment or something like that...
    /// Also, it should be agnostic - core data v. disk should be the same, just
    /// a one line switch...
    let coreDataManager = CoreDataManager()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let scene = scene as? UIWindowScene else { return }
        
        let entity = Event(entity: Event.entity(), insertInto: coreDataManager.context)
        entity.title = Symbol(entity: Symbol.entity(), insertInto: coreDataManager.context)
        entity.title.stringValue = "Interesting"
        try! coreDataManager.context.save()
        
        let environment = RootEnvironment(dataManager: coreDataManager)
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
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene)
    {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene)
    {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene)
    {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
//        Database.save()
    }
}
