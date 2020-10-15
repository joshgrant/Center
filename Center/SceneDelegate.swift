//
//  SceneDelegate.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
    var window: UIWindow?
    var sceneState: SceneState = .disconnected
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let scene = scene as? UIWindowScene else {
            assertionFailure("Failed to get the scene")
            return
        }
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            assertionFailure("Failed to get the app delegate")
            return
        }
        
//        showWindow(scene: scene, context: delegate.context)
        window = createAndShowWindow(scene: scene, context: delegate.context)
        
        if let activity = session.stateRestorationActivity
        {
            sceneState = restore(from: activity) ?? .disconnected
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene)
    {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        
        print("Scene did disconnect")
        // UIKit also posts a didDisconnectNotification notification in addition to calling this method.
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene)
    {
        print("Scene did become active")
        // In addition to calling this method, UIKit posts a didActivateNotification and a didBecomeActiveNotification.
    }
    
    func sceneWillResignActive(_ scene: UIScene)
    {
        print("Scene will resign active")
        // In addition to calling this method, UIKit posts a willDeactivateNotification and a willResignActiveNotification.
    }
    
    func sceneWillEnterForeground(_ scene: UIScene)
    {
        print("Scene will enter foreground")
        // In addition to calling this method, UIKit posts a didActivateNotification and a willEnterForegroundNotification.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene)
    {
        print("Scene did enter background")
        // In addition to calling this method, UIKit posts a didEnterBackgroundNotification notification from UIApplication and UIScene.
    }
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity?
    {
        let activity = NSUserActivity(activityType: Bundle.main.activityType)
        __store(sceneState: sceneState, in: activity)
        return activity
    }
}
