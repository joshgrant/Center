//
//  Notification.Name+Extensions.swift
//  Center
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

// MARK: - Scene updates

extension Notification.Name
{
    static let sceneDidBecomeActive = Notification.Name(rawValue: "sceneDidBecomeActive")
    static let sceneWillResignActive = Notification.Name(rawValue: "sceneWillResignActive")
    static let sceneWillEnterForeground = Notification.Name(rawValue: "sceneWillEnterForeground")
    static let sceneDidEnterBackground = Notification.Name(rawValue: "sceneDidEnterBackground")
}

