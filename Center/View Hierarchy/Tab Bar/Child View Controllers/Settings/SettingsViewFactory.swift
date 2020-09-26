//
//  SettingsViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit
import Architecture

protocol SettingsViewFactoryProtocol: TabBarItemFactoryProtocol
{
    
}

struct SettingsViewFactory: SettingsViewFactoryProtocol
{
    func makeTabBarItem() -> UITabBarItem
    {
        return UITabBarItem(
            title: "Settings",
            image: Icon.settings.getImage(),
            selectedImage: Icon.settings.getImage())
    }
}
