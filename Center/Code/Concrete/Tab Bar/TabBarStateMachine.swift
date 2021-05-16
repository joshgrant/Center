//
//  TabBarStateMachine.swift
//  Center
//
//  Created by Joshua Grant on 10/20/20.
//

import Foundation

enum TabBarState: String, Codable
{
    case dashboard
    case library
    case inbox
    case settings
}

class TabBarStateMachine: StateMachine<TabBarState>
{
    // MARK: - Variables
    
    var dashboardStateMachine: DashboardStateMachine = .init(current: .normal)
    var libraryStateMachine: LibraryStateMachine = .init(current: .normal)
    var inboxStateMachine: InboxStateMachine = .init(current: .empty)
    var settingsStateMachine: SettingsStateMachine = .init(current: .normal)
    
    // MARK: - Functions
    
//    override func canTransition(to: TabBarState) -> Bool
//    {
//        switch (current, to)
//        {
//        case (.dashboard, .library),
//             (.library, .dashboard):
//            return true
//        default:
//            return super.canTransition(to: to)
//        }
//    }
}
