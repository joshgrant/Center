//
//  ActionClosure.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import Foundation

typealias ActionPerformClosure = ((_ sender: Any) -> AppState)

class ActionClosure
{
    var id: UUID = .init()
    var performClosure: ActionPerformClosure
    
    init(performClosure: @escaping ActionPerformClosure)
    {
        self.performClosure = performClosure
    }
    
    @objc func perform(sender: Any) -> AppState
    {
        return performClosure(sender)
    }
    
    deinit {
        print("Action closure: \(id) was de-initialized")
    }
}

extension ActionClosure: Hashable
{
    static func == (lhs: ActionClosure, rhs: ActionClosure) -> Bool
    {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(id)
    }
}
