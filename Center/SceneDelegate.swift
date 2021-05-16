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
    
    var appMachine: AppStateMachine {
        AppDelegate.shared.appMachine
    }
    
    var context: Context {
        AppDelegate.shared.context
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let scene = scene as? UIWindowScene else {
            assertionFailure("Failed to get the scene")
            return
        }
        
        let sceneMachine: SceneStateMachine
        
        if let activity = session.stateRestorationActivity
        {
            sceneMachine = restore(from: activity) ?? findOrMakeSceneMachine(from: scene)
        }
        else
        {
            sceneMachine = findOrMakeSceneMachine(from: scene)
        }
        
        window = createAndShowWindow(scene: scene, context: context)
        
        sceneMachine.transition(to: .inactive)
    }
    
    func sceneDidDisconnect(_ scene: UIScene)
    {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        
        print("Scene did disconnect")
        // UIKit also posts a didDisconnectNotification notification in addition to calling this method.
        findOrMakeSceneMachine(from: scene).transition(to: .disconnected)
    }
    
    func sceneWillResignActive(_ scene: UIScene)
    {
        print("Scene will resign active")
        // In addition to calling this method, UIKit posts a willDeactivateNotification and a willResignActiveNotification.
        findOrMakeSceneMachine(from: scene).transition(to: .inactive)
    }
    
    func sceneWillEnterForeground(_ scene: UIScene)
    {
        print("Scene will enter foreground")
        // In addition to calling this method, UIKit posts a didActivateNotification and a willEnterForegroundNotification.
        findOrMakeSceneMachine(from: scene).transition(to: .enteringForeground)
    }
    
    func sceneDidBecomeActive(_ scene: UIScene)
    {
        print("Scene did become active")
        // In addition to calling this method, UIKit posts a didActivateNotification and a didBecomeActiveNotification.
        findOrMakeSceneMachine(from: scene).transition(to: .active)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene)
    {
        print("Scene did enter background")
        // In addition to calling this method, UIKit posts a didEnterBackgroundNotification notification from UIApplication and UIScene.
        findOrMakeSceneMachine(from: scene).transition(to: .background)
    }
    
    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity?
    {
        let activity = NSUserActivity(activityType: Bundle.main.activityType)
        let sceneMachine = findOrMakeSceneMachine(from: scene)
        __store(sceneState: sceneMachine, in: activity)
        return activity
    }
    
    // MARK: - Utility
    
    func findOrMakeSceneMachine(from scene: UIScene) -> SceneStateMachine
    {
        if let sceneMachine = appMachine.sceneMachines[scene]
        {
            return sceneMachine
        }
        else
        {
            appMachine.sceneMachines[scene] = SceneStateMachine(current: .inactive)
            return findOrMakeSceneMachine(from: scene)
        }
    }
}
