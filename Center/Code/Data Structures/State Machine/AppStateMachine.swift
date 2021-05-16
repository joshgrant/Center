//
//  AppStateMachine.swift
//  Center
//
//  Created by Joshua Grant on 10/16/20.
//

import UIKit

enum AppState: String, Codable
{
    case background
    case foreground
}

class AppStateMachine: StateMachine<AppState>
{
    var sceneMachines: [UIScene: SceneStateMachine] = [:]
}
