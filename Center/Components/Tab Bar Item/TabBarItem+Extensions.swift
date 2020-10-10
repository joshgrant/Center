//
//  TabBarItem.swift
//  Center
//
//  Created by Joshua Grant on 10/9/20.
//

import UIKit
import Core

public extension TabBarItem
{
    var title: String
    {
        switch self
        {
        case .dashboard:
            return "Dashboard"
        case .library:
            return "Library"
        case .inbox:
            return "Inbox"
        case .settings:
            return "Settings"
        }
    }
    
    var image: UIImage?
    {
        switch self
        {
        case .dashboard:
            return Icon.dashboard.getImage()
        case .library:
            return Icon.library.getImage()
        case .inbox:
            return Icon.inbox.getImage()
        case .settings:
            return Icon.settings.getImage()
        }
    }
    
    var selectedImage: UIImage?
    {
        switch self
        {
        case .dashboard:
            return Icon.dashboard.getImage()
        case .library:
            return Icon.dashboard.getImage()
        case .inbox:
            return Icon.dashboard.getImage()
        case .settings:
            return Icon.dashboard.getImage()
        }
    }
}

public extension TabBarItem
{
    func makeUITabBarItem() -> UITabBarItem
    {
        UITabBarItem(
            title: title,
            image: image,
            selectedImage: selectedImage)
    }
}
