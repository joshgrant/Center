//
//  AppState.swift
//  Center
//
//  Created by Joshua Grant on 10/14/20.
//

import Foundation

/// This object gets created at app launch, serialized on app background/quit, and deserialized on app resume/second launch
/// It contains the entire state of the application: User interface states mostly
/// I think the CoreData model holds the entities states...
struct AppState
{
    var selectedTab: TabBarItem
    
    var dashboardState: DashboardState
    var libraryState: LibraryState
    var inboxState: InboxState
    var settingsState: SettingsState
    
}

struct DashboardState
{
    /// If the search is active
    var searching: Bool
    var searchText: String
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
