//
//  ObserverForSceneUpdatesEventResponder.swift
//  Architecture
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation
import UIKit

protocol ObserverForSceneUpdatesEventResponder: EventResponder
{
    /// Resume any tasks that were paused when the scene was inactive
    func sceneDidBecomeActive()
    
    /// May occur because of temporary interruptions, such as a phone call
    func sceneWillResignActive()
    
    /// Transitions from background to foreground
    /// Undo the changes made when entering the background
    func sceneWillEnterForeground()
    
    /// Use this method to save data, release shared resources, and store
    /// enough scene-specific state info to restore the scene back to its current state
    func sceneDidEnterBackground()
}
