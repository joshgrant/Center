//
//  RHistory.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RHistory: Object, History
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var amount: Double = 0
    @objc dynamic public var date: Date = .init()
    @objc dynamic public var event: HistoryEvent = .created
    
    public var linkedTransferFlows = LinkingObjects(fromType: RTransferFlow.self, property: "_history")
    public var linkedProcessFlows = LinkingObjects(fromType: RProcessFlow.self, property: "_history")
    public var linkedEvents = LinkingObjects(fromType: REvent.self, property: "_history")
}
