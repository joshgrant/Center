//
//  AppState.swift
//  Center
//
//  Created by Joshua Grant on 10/14/20.
//

import UIKit

public enum ViewState
{
    case dashboard
    case library
    case inbox
    case settings
    
    case systemDetail
    
//    case dashboard
//
//    case libraryList
//
//    case systemList
//    case stockList
//    case flowList
//    case eventList
//    case conversionList
//    case dimensionList
//    case symbolList
//    case noteList
//    case processList
//
//    case systemDetail
//    case stockDetail
//    case amountDetail
//    case flowDetail
//    case eventDetail
//    case conversionDetail
//    case dimensionDetail
//    case symbolDetail
//    case noteDetail
//    case blockDetail
//    case processDetail
//
//    case systemInfo
//    case stockInfo
//    case amountInfo
//    case flowInfo
//    case eventInfo
//    case conversionInfo
//    case dimensionInfo
//    case symbolInfo
//    case noteInfo
//    case blockInfo
//    case processInfo
//
//    case idealInfo
//    case netInfo
//
//    case conditionInfo
//    case conditionDetail
//
//    case stockSelector
//    case targetSelector
//
//    case priorityInfo
//    case relationshipInfo
//
//    case link(type: Any)
//    case add(type: Any)
//
//    case completionTypeInfo
//    case completionInfo
}

/// This object gets created at app launch, serialized on app background/quit, and deserialized on app resume/second launch
/// It contains the entire state of the application: User interface states mostly
/// I think the CoreData model holds the entities states...
@objc public class AppState: NSObject
{
//    var selectedTab: TabBarItem = .dashboard
    var viewState: ViewState = .dashboard
    
    var dashboardState = DashboardState()
    var libraryState = LibraryState()
    var inboxState = InboxState()
    var settingsState = SettingsState()
    
    var activeViewController: UIViewController?
    
    func canTransition(to newState: ViewState) -> Bool
    {
        switch (viewState, newState)
        {
        case (.dashboard, .library):
            return true
        case (.library, .dashboard):
            return true
        case (.dashboard, .systemDetail),
             (.library, .systemDetail):
            return true
        default:
            return false
        }
    }
    
    func transition(to newState: ViewState)
    {
        viewState = newState
    }
}

struct DashboardState
{
    /// If the search is active
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
