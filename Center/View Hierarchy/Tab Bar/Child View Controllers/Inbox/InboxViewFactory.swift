//
//  InboxViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

protocol InboxViewFactoryProtocol: TabBarItemFactoryProtocol
{
    
}

struct InboxViewFactory: InboxViewFactoryProtocol
{
    func makeTabBarItem() -> UITabBarItem
    {
        return UITabBarItem(
            title: "Inbox",
            image: Icon.inbox.getImage(),
            selectedImage: Icon.inbox.getImage())
    }
}
