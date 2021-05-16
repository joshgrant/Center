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

// ---

//enum EntityListState
//{
//    case searching
//    case transitioningBack
//    case transitioningToDetail
//    case openingAddModal
//    case displayingAddModal
//}
//
//enum FlowDetailState
//{
//    case transitioningBack
//    case addingPin
//    case removingPin
//    case activatingRun
//    case running
//    case editingTitle
//    case transitioningToAmountDetail
//    case transitioningToFromDetail
//    case transitioningToToDetail
//    case transitioningToDurationDetail
//    case togglingUserCompletion
//    case transitioningToEventDetail
//    case transitoningToHistoryDetail
//    case transitioningToFlowDetail
//}
//
//enum SystemDetailState
//{
//    case openingDuplicateDialog
//    case displayingDuplicateDialog
//    case addingPin
//    case removingPin
//    case editingTitle
//    case openingInfoDialog
//    case displayingInfoDialog
//    case completingIdealFlow
//    case transitioningToIdealFlow
//    case transitioningToStockDetail
//    case transitioningToFlowDetail
//    case transitioningToEventDetail
//    case transitioningToNoteDetail
//}

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

