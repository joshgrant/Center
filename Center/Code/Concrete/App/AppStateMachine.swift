//
//  AppStateMachine.swift
//  Center
//
//  Created by Joshua Grant on 10/16/20.
//

import UIKit

enum AppState: String, Codable
{
    case background
    case foreground
}

class AppStateMachine: StateMachine<AppState>
{
    var sceneMachines: [UIScene: SceneStateMachine] = [:]
}

// ----

func restore(from activity: NSUserActivity) -> SceneStateMachine?
{
    let data = try! JSONSerialization.data(withJSONObject: activity.userInfo!, options: .fragmentsAllowed)
    let decoder = JSONDecoder()
    let state = try! decoder.decode(SceneStateMachine.self, from: data)
    return state
}

func __store(sceneState: SceneStateMachine, in activity: NSUserActivity)
{
    let encoder = JSONEncoder()
    let data = try! encoder.encode(sceneState)
    let jsonObject = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [AnyHashable: Any]
    activity.addUserInfoEntries(from: jsonObject)
}

public func createAndShowWindow(scene: UIWindowScene, context: Context) -> UIWindow?
{
    let window = UIWindow(windowScene: scene)
    let root = makeSceneRootViewController(context: context)
    window.rootViewController = root
    window.makeKeyAndVisible()
    return window
    
    //    let dashboardState = DashboardState.normal
    //    let libraryState = LibraryState.normal
    //    let tabBarState = TabBarState.dashboard
    //    let sceneState = SceneState.active
    //
    //        return AppState(context: appState.context,
    //                        sceneState: sceneState)
}

public func makeSceneRootViewController(context: Context) -> UIViewController
{
    // TODO: Override these methods (not nil) to handle tab selection callbacks
    // TODO: Retain a reference to the delegate so it doesn't deallocate
    //    let delegate = TabBarControllerDelegate(shouldSelect: nil, didSelect: nil)
    let delegate = TabBarControllerDelegate { tabBarController, viewController in
        print("Tab should select")
        return true
    } didSelect: { tabBarController, viewController in
        print("Tab did select")
    }
    
    let root = TabBarController(delegate: delegate)
    let tabControllers = makeTabBarControllers(context: context)
    root.viewControllers = tabControllers
    return root
}
