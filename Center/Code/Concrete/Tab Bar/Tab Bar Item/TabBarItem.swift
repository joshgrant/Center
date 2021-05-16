//
//  TabBarItem.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import Foundation

public enum TabBarItem
{
    case dashboard
    case library
    case inbox
    case settings
}

extension TabBarItem: CaseIterable { }
