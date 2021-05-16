//
//  SceneStateMachine.swift
//  Center
//
//  Created by Joshua Grant on 10/20/20.
//

import Foundation

enum SceneState: String, Codable
{
    case discarded
    case disconnected
    case inactive
    case active
    case enteringForeground
    case background
}

class SceneStateMachine: StateMachine<SceneState>
{
    // MARK: - Variables
    
    var tabBarMachine: TabBarStateMachine = .init(current: .dashboard)
    
    // MARK: - Functions
    
    override func canTransition(to: SceneState) -> Bool
    {
        switch (current, to)
        {
        case (.discarded, _):
            return false
        default:
            return true
        }
    }
}
