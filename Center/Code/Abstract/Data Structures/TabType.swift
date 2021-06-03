//
//  TabType.swift
//  Center
//
//  Created by Joshua Grant on 5/29/21.
//

import Foundation
import UIKit

public enum TabType
{
    case dashboard
    case library
    case inbox
    case settings
    
    var icon: Icon
    {
        switch self
        {
        case .dashboard: return .dashboard
        case .library: return .library
        case .inbox: return .inbox
        case .settings: return .settings
        }
    }
    
    var tabBarItem: UITabBarItem
    {
        UITabBarItem(
            title: title,
            image: icon.getImage(),
            selectedImage: icon.getImage())
    }
}

extension TabType: Pageable
{
    var title: String
    {
        switch self
        {
        case .dashboard: return "Dashboard"
        case .library: return "Library"
        case .inbox: return "Inbox"
        case .settings: return "Settings"
        }
    }
}

extension TabType: CaseIterable {}
