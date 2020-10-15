//
//  AppState.swift
//  Center
//
//  Created by Joshua Grant on 10/14/20.
//

import UIKit
import GameplayKit.GKState

enum AppState
{
    case running
}

enum SceneState: String, Codable
{
    case disconnected
    case inactive
    case active
}

enum TabBarState
{
    case dashboard
    case library
    case inbox
    case settings
}

func canTransition(from: AppState, to: AppState) -> Bool
{
    return true
}

func canTransition(from: SceneState, to: SceneState) -> Bool
{
    // TODO: Not sure if this should always return true
    return true
}

func canTransition(from: TabBarState, to: TabBarState) -> Bool
{
    switch (from, to)
    {
    case (.dashboard, .library),
         (.library, .dashboard):
        return true
    default:
        return false
    }
}


//
//class LibraryStateMachine: GKStateMachine
//{
//
//}
//
//class EntityListStateMachine: GKStateMachine
//{
//
//}
//
//class FlowDetailStateMachine: GKStateMachine
//{
//
//}
//
//class SystemDetailStateMachine: GKStateMachine
//{
//
//}

//
//import UIKit
//
//
func restore(from activity: NSUserActivity) -> SceneState?
{
    let data = try! JSONSerialization.data(withJSONObject: activity.userInfo!, options: .fragmentsAllowed)
    let decoder = JSONDecoder()
    let state = try! decoder.decode(SceneState.self, from: data)
    return state
}

func __store(sceneState: SceneState, in activity: NSUserActivity)
{
    let encoder = JSONEncoder()
    let data = try! encoder.encode(sceneState)
    let jsonObject = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [AnyHashable: Any]
    activity.addUserInfoEntries(from: jsonObject)
}
//
//public class AppState: Codable
//{
//    var sceneState: SceneState?
//}
//
//public class SceneState: Codable
//{
//    enum State
//    {
//        case disconnected
//        case inactive(scene: UIWindowScene)
//        case active
//    }
//    
//    var state: State = .disconnected
//    
////    var window: UIWindow?
//    var visible: Bool
//    
//    var tabBarState: TabBarState?
//    
//    weak var appState: AppState?
//    
//    init(visible: Bool, tabBarState: TabBarState?)
//    {
////        self.window = window
//        self.visible = visible
//        self.tabBarState = tabBarState
//    }
//    
//    var tabBarDelegate: TabBarControllerDelegate = {
//        
//        let shouldSelect: ShouldSelectTab = { _, controller -> Bool in
//            // Return if the app state can transition to the next state
//            return true
//        }
//        
//        let didSelect: DidSelectTab = { _, controller in
//            // Transition the app to the next state
//        }
//        
//        return TabBarControllerDelegate(shouldSelect: shouldSelect, didSelect: didSelect)
//    }()
//    
//    func canTransition(to: State) -> Bool
//    {
//        return true
//    }
//    
//    func transition(to: State)
//    {
//        guard canTransition(to: to) else { return }
//        
//        switch (state, to)
//        {
//        case (.disconnected, .inactive(let scene)):
//            print("Disconnect to inactive")
//            showWindow(scene: scene, appState: appState!) // I hate the explicit unwrap!
//        case (.inactive, .active):
//            print("Inactive to active")
//        default:
//            break
//        }
//        
//        state = to
//    }
//}
//
public func createAndShowWindow(scene: UIWindowScene, context: Context) -> UIWindow?
{
    let window = UIWindow(windowScene: scene)
    let root = makeSceneRootViewController(context: context)
    window.rootViewController = root
    window.makeKeyAndVisible()
    return window
//
//    let dashboardState = DashboardState(
//        searching: false,
//        updating: false,
//        child: nil)
//    let libraryState = LibraryState(
//        searching: false,
//        child: nil)
//    let tabBarState = TabBarState(
//        activeTab: .dashboard,
//        dashboardState: dashboardState,
//        libraryState: libraryState)
//    let sceneState = SceneState(
//        visible: true,
//        tabBarState: tabBarState)
//
//    return AppState(context: appState.context,
//                    sceneState: sceneState)
}
//
public func makeSceneRootViewController(context: Context) -> UIViewController
{
    // TODO: Override these methods (not nil) to handle tab selection callbacks
    // TODO: Retain a reference to the delegate so it doesn't deallocate
    let delegate = TabBarControllerDelegate(shouldSelect: nil, didSelect: nil)
    let root = TabBarController(delegate: delegate)
    let tabControllers = makeTabBarControllers(context: context)
    root.viewControllers = tabControllers
    return root
}
//
//public struct TabBarState: Codable
//{
//    var activeTab: TabBarItem
//    
//    var dashboardState: DashboardState
//    var libraryState: LibraryState
//}
//
//public struct DashboardState: Codable
//{
//    var searching: Bool
//    var updating: Bool
//}
//
//public struct LibraryState: Codable
//{
//    var searching: Bool
//}
//
//public struct SystemListState: Codable
//{
//    var searching: Bool
//}
//
//public struct SystemDetailState: Codable
//{
//    var presentingIdealInfo: Bool
//    
//    var searchingStock: Bool
//    var addingStock: Bool
//    
//    var searchingFlow: Bool
//    var addingFlow: Bool
//    
//    var searchingEvent: Bool
//    var addingEvent: Bool
//    
//    var searchingNote: Bool
//    var addingNote: Bool
//}
//
//public struct InboxState: Codable
//{
//    
//}
//
//public struct SettingsState: Codable
//{
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
////let stateNotificationCenter: NotificationCenter = {
////    let center = NotificationCenter()
////    return center
////}()
//
////public struct AppState
////{
////    // Should contain all of the state in here.
////
////    //
////}
////
////func registerForStateNotifications(stateQueue: OperationQueue)
////{
//////    NotificationCenter
//////        .default
//////        .addObserver(
//////            forName: .attemptedStateChange,
//////            object: nil,
//////            queue: stateQueue) { notification in
//////            // TODO: Do something with the attempted state change...
//////        }
////}
////
////public func makeShouldSelectTab(appState: AppState) -> ShouldSelectTab
////{
////    return { _, viewController in
////        guard let tab = tabFor(viewController: viewController) else {
////            return false
////        }
////
////        let newState = state(forTabBarItem: tab)
////        return canTransition(to: newState, appState: appState)
////    }
////}
////
////public func makeDidSelectTab(appState: AppState) -> DidSelectTab
////{
////    return { _, viewController in
////        guard let tab = tabFor(viewController: viewController) else {
////            return
////        }
////
////        let newState = state(forTabBarItem: tab)
////
////        attemptToTransition(to: newState)
////
////        // TODO: This should modify the app state
////        // What if we used notifications?
////
////        //        let newState = state(forTabBarItem: tab)
////        //        return transition(to: newState, appState: appState)
////    }
////}
//
//// I think I'm figuring out that I need to play ball with the run loop. The run loop
//// should contain the app state and each change should modify the app state... I need
//// to investigate if this is a valid approach. Ideally, each event takes the current
//// app state
//
//
////// TODO: Don't love the class...
////public class AppState
////{
////    static var current: Any = AppState(name: .initial, storage: nil)
////
////    static private let queue: OperationQueue = {
////        let queue = OperationQueue()
////        queue.maxConcurrentOperationCount = 1
////        return queue
////    }()
////
////    static func canTransition(to: Any) -> Bool
////    {
////
////    }
////
////    static func transition(to: Any) -> Any
////    {
////        guard canTransition(to: to) else { return current }
////
////        // Maybe use the navigation logic here?
////
////        return to
////    }
////
////    var name: Name
////    var storage: [AnyHashable: Any]?
////
////    init(name: Name, storage: [AnyHashable: Any]?)
////    {
////        self.name = name
////        self.storage = storage
////    }
////}
////
////extension AppState
////{
////    enum Name
////    {
////        case initial
////    }
////}
////struct State
////{
////    var controller: UIViewController?
////}
////
////struct LaunchScreenState
////{
////}
////
////struct DashboardState
////{
////    var controller: UIViewController?
////    var searching: Bool = false
////    var searchText: String = ""
////}
////
////struct LibraryState
////{
////    var controller: UIViewController?
////}
////
////struct InboxState
////{
////    var controller: UIViewController?
////}
////
////struct SettingsState
////{
////    var controller: UIViewController?
////}
////
////struct SystemDetailState
////{
////    var system: System
////}
//
////func canTransition(to: Any, appState: AppState) -> Bool
////{
////    let from = appState.state
////    switch (from, to)
////    {
////    case (is DashboardState, is LibraryState):
////        return true
////    case (is LibraryState, is DashboardState):
////        return true
////    case (is DashboardState, is SystemDetailState),
////         (is LibraryState, is SystemDetailState):
////        return true
////    default:
////        return false
////    }
////}
////
////private func transition(to: Any, appState: AppState) -> AppState
////{
////    guard OperationQueue.current == stateQueue else {
////        fatalError("Trying to access the state from a different queue")
////    }
////
////    let from = appState.state
////    guard canTransition(to: to, appState: appState) else {
////        print("Could not transition from: \(from) to: \(to) with \(appState)")
////        return appState
////    }
////
////    switch (from, to)
////    {
////    case (_, let x as SystemDetailState):
////        let detailController = makeSystemDetailViewController(system: x.system, appState: appState)
////        // Can we assume there is always a navigation controller?
////        appState
////            .controller?
////            .navigationController?
////            .pushViewController(detailController, animated: true)
////        return AppState(state: to, controller: detailController)
////    default:
////        return appState
////    }
////}
////
////func attemptToTransition(to: Any)
////{
////    stateNotificationCenter
////        .post(name: .attemptedStateChange,
////              object: nil,
////              userInfo: ["to": to])
////}
////
////extension Notification.Name
////{
////    static let attemptedStateChange = Notification.Name("com.joshgrant.Center.notification.attemptedStateChange")
////}
////
