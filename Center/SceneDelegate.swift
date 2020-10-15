//
//  SceneDelegate.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appState = AppState(state: LaunchScreenState(), controller: nil) // TODO: Serialize and Deserialize this...
    lazy var tabControllerDelegate = TabBarControllerDelegate()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let scene = scene as? UIWindowScene else { return }
        
        var container = try! makeContainer(modelName: "Model")
        container = try! loadPersistentStores(on: container)
        let _context = context(from: container)
        populateDatabaseWithWaterSystem(context: _context)
        populateDatabaseWithBirthdayPartyEvent(context: _context)
        
        let root = TabBarController(delegate: tabControllerDelegate)
        let tabControllers = makeTabBarControllers(appState: appState, context: _context)
        root.viewControllers = tabControllers
        let dashboardController = root.viewControllers?.first
        
        appState = AppState(state: DashboardState(), controller: dashboardController)
        
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

func makeShouldSelectTab(appState: AppState) -> ShouldSelectTab
{
    return { _, viewController in
        guard let tab = tabFor(viewController: viewController) else {
            return false
        }
        
        let newState = state(forTabBarItem: tab)
        return canTransition(to: newState, appState: appState)
    }
}

func makeDidSelectTab(appState: AppState) -> DidSelectTab
{
    return { _, viewController in
        guard let tab = tabFor(viewController: viewController) else {
            return
        }
        
        // TODO: This should modify the app state
        
//        let newState = state(forTabBarItem: tab)
//        return transition(to: newState, appState: appState)
    }
}

// I think I'm figuring out that I need to play ball with the run loop. The run loop
// should contain the app state and each change should modify the app state... I need
// to investigate if this is a valid approach. Ideally, each event takes the current
// app state 
