//
//  TabBarItem.swift
//  Center
//
//  Created by Joshua Grant on 10/9/20.
//

import UIKit

public func title(tabBarItem: TabBarItem) -> String
{
    switch tabBarItem
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

public func image(tabBarItem: TabBarItem) -> UIImage?
{
    switch tabBarItem
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

public func selectedImage(tabBarItem: TabBarItem) -> UIImage?
{
    return image(tabBarItem: tabBarItem)
}

func makeUITabBarItem(tabBarItem: TabBarItem) -> UITabBarItem
{
    let _title = title(tabBarItem: tabBarItem)
    let _image = image(tabBarItem: tabBarItem)
    let _selectedImage = selectedImage(tabBarItem: tabBarItem)
    
    return UITabBarItem(
        title: _title,
        image: _image,
        selectedImage: _selectedImage)
}
