//
//  StateMachine.swift
//  Center
//
//  Created by Joshua Grant on 10/20/20.
//

import Foundation

class StateMachine<State>: Codable where State: Hashable & Codable
{
    // MARK: - Defined types
    
    enum CodingKeys: CodingKey
    {
        case current
    }
    
    // MARK: - Variables
    
    private(set) var current: State
    private(set) var stateQueue: [State]
    
    private(set) var operationQueue: OperationQueue
    
    // MARK: - Initialization
    
    init(current: State)
    {
        self.current = current
        
        stateQueue = [current]
        operationQueue = OperationQueue()
        registerForNotifications()
        processStateQueue()
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        current = try container.decode(State.self, forKey: .current)
        stateQueue = [current]
        operationQueue = OperationQueue()
        
        registerForNotifications()
        processStateQueue()
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(current, forKey: .current)
    }
    
    // MARK: - Functions
    
    func processStateQueue()
    {
        guard stateQueue.count > 0 else { return }
        
        let nextState = stateQueue.removeFirst()
        
        print("\(String(describing: self)): transitioned to: \(nextState)")
        transition(to: nextState)
        
        // Does this need to be performed on a separate thread?
        // Does this need to be synchronized with the main queue?
        if stateQueue.count > 0
        {
            operationQueue.addOperation {
                print("\(String(describing: self)): processing the state queue 2")
                self.processStateQueue()
            }
        }
    }
    
    internal func canTransition(to: State) -> Bool
    {
        return current == to
    }
    
    func transition(to nextState: State)
    {
        guard canTransition(to: nextState) else {
            DispatchQueue.main.async {
                print("\(String(describing: self)): failed state change to: \(nextState)")
                self.postStateChangeFailedNotification(failedState: nextState)
            }
            return
        }
        
        DispatchQueue.main.async {
            print("\(String(describing: self)): posting state change to: \(nextState)")
            self.postStateChangeNotification(state: nextState)
        }
        
        // If from background to foreground, we want to create the
        // window and the object memory graph
        // If from foreground to background, we want to save the database
        // Where should these be handled?
    }
    
    // MARK: - Notifications
    
    func registerForNotifications()
    {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(observeStateChangeRequest(_:)),
            name: .stateChangeRequest,
            object: nil)
    }
    
    @objc func observeStateChangeRequest(_ notification: Notification)
    {
        // TODO: Perhaps pass down other states here with a type switch...
        if let state = notification.userInfo?["state"] as? State
        {
            stateQueue.append(state)
            
            operationQueue.addOperation {
                print("\(String(describing: self)): processing the state queue 1")
                self.processStateQueue()
            }
        }
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
            userInfo: ["currentState" : current,
                       "failedState" : failedState])
    }
}

extension Notification.Name
{
    static let stateChangeRequest = Notification.Name("me.joshgrant.Center.notification.stateChangeRequest")
    static let stateChangeFailed = Notification.Name("me.joshgrant.Center.notification.stateChangeFailed")
    static let stateChange = Notification.Name("me.joshgrant.Center.notification.stateChange")
}
