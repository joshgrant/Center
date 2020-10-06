//
//  LibraryViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit
import Architecture

protocol LibraryViewFactoryProtocol: TabBarItemFactoryProtocol
{
    
}

struct LibraryViewFactory: LibraryViewFactoryProtocol
{
    func makeTabBarItem() -> UITabBarItem
    {
        return UITabBarItem(
            title: "Library",
            image: Icon.library.getImage(),
            selectedImage: Icon.library.getImage())
    }
}
