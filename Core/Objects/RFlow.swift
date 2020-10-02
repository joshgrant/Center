//
//  RFlow.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

class RFlow: Object, Flow
{
    @objc dynamic var amount: Double = 0
    @objc dynamic var from: Stock?
    @objc dynamic var to: Stock?
    @objc dynamic var duration: TimeInterval = 0
    @objc dynamic var delay: TimeInterval = 0
    @objc dynamic var requiresUserCompletion: Bool = false
    @objc dynamic var contactDelegate: Contact?
    
    func events() -> [Event] {
        return []
    }
    
    func history() -> [FlowHistory] {
        return []
    }
    
    func add(history: FlowHistory) {
        
    }
    
    func eventsCount() -> Int {
        return 0
    }
    
    func historyCount() -> Int {
        return 0
    }
    
    var id: UUID = .init()
    
    var symbol: Symbol?
    
    func notes() -> [Note] {
        return []
    }
    
    func link(note: Note) {
        
    }
    
    func unlink(note: Note) {
        
    }
}
