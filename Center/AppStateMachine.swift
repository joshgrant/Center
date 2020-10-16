//
//  AppStateMachine.swift
//  Center
//
//  Created by Joshua Grant on 10/16/20.
//

import Foundation

class AppStateMachine: Codable
{
    // MARK: - Defined types
    
    enum State: String, Codable
    {
        case background
        case foreground
    }
    
    enum CodingKeys: CodingKey
    {
        case currentState
    }
    
    // MARK: - Variables
    
    var currentState: State
    var stateQueue: [State] {
        didSet {
            operationQueue.addOperation {
                self.processStateQueue()
            }
        }
    }
    
    var operationQueue: OperationQueue
    
    // MARK: - Initialization
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        currentState = try container.decode(State.self, forKey: .currentState)
        operationQueue = OperationQueue()
        stateQueue = [currentState]
    }
    
    // MARK: - Functions
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(currentState, forKey: .currentState)
    }
}

// MARK: - State Machine

extension AppStateMachine
{
    func processStateQueue()
    {
        guard stateQueue.count > 0 else { return }
        
        let nextState = stateQueue.removeFirst()
        
        transition(to: nextState)
        
        // Does this need to be performed on a separate thread?
        // Does this need to be synchronized with the main queue?
        if stateQueue.count > 0
        {
            operationQueue.addOperation {
                self.processStateQueue()
            }
        }
    }
    
    func canTransition(to: State) -> Bool
    {
        return true
    }
    
    func transition(to nextState: State)
    {
        guard canTransition(to: nextState) else {
            DispatchQueue.main.async {
                self.postStateChangeFailedNotification(failedState: nextState)
            }
            return
        }
        
        DispatchQueue.main.async {
            self.postStateChangeNotification(state: nextState)
        }
        
        // If from background to foreground, we want to create the
        // window and the object memory graph
        // If from foreground to background, we want to save the database
        // Where should these be handled?
    }
}

// MARK: - Notifications

extension AppStateMachine
{
    func registerForNotifications()
    {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(observeStateChangeRequest(_:)),
            name: .stateChangeRequest,
            object: nil)
    }
    
    func postStateChangeNotification(state: State)
    {
        NotificationCenter.default.post(
            name: .stateChange,
            object: self,
            userInfo: ["state" : state])
    }
    
    func postStateChangeFailedNotification(failedState: State)
    {
        NotificationCenter.default.post(
            name: .stateChangeFailed,
            object: self,
            userInfo: ["currentState" : currentState,
                       "failedState" : failedState])
    }
    
    @objc func observeStateChangeRequest(_ notification: Notification)
    {
        // TODO: Perhaps pass down other states here with a type switch...
        if let state = notification.userInfo?["state"] as? State
        {
            stateQueue.append(state)
        }
    }
}
