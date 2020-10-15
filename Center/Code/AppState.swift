//
//  AppState.swift
//  Center
//
//  Created by Joshua Grant on 10/14/20.
//

import UIKit


public struct AppState
{
    var state: Any
    // TODO: Is the controller supposed to be part of this? OR should we
    // consider using a coordinator pattern?
    var controller: UIViewController?
}

struct LaunchScreenState
{
    
}

struct DashboardState
{
    var searching: Bool = false
    var searchText: String = ""
}

struct LibraryState
{
    
}

struct InboxState
{
    
}

struct SettingsState
{
    
}

struct SystemDetailState
{
    var system: System
}

func canTransition(to: Any, appState: AppState) -> Bool
{
    let from = appState.state
    switch (from, to)
    {
    case (is DashboardState, is LibraryState):
        return true
    case (is LibraryState, is DashboardState):
        return true
    case (is DashboardState, is SystemDetailState),
         (is LibraryState, is SystemDetailState):
        return true
    default:
        return false
    }
}

func transition(to: Any, appState: AppState) -> AppState
{
    let from = appState.state
    guard canTransition(to: to, appState: appState) else {
        print("Could not transition from: \(from) to: \(to) with \(appState)")
        return appState
    }
    
    switch (from, to)
    {
    case (_, let x as SystemDetailState):
        let detailController = makeSystemDetailViewController(system: x.system, appState: appState)
        // Can we assume there is always a navigation controller?
        appState
            .controller?
            .navigationController?
            .pushViewController(detailController, animated: true)
        return AppState(state: to, controller: detailController)
    default:
        return appState
    }
}
