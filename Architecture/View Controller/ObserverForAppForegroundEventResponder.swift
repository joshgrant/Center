//
//  ObserverForAppForegroundEventResponder.swift
//  Architecture
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

protocol ObserverForSceneUpdatesEventResponder: EventResponder
{
    /// Resume any tasks that were paused when the scene was inactive
    func sceneDidBecomeActive(_ scene: UIScene)
    
    /// May occur because of temporary interruptions, such as a phone call
    func sceneWillResignActive(_ scene: UIScene)
    
    /// Transitions from background to foreground
    /// Undo the changes made when entering the background
    func sceneWillEnterForeground(_ scene: UIScene)
    
    
}
