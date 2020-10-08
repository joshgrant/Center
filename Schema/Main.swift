//
//  Main.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation
import CoreData
import UIKit
import Core

//enum PinState
//{
//    case pinned
//    case unpinned
//}
//
//func set(name: String, on event: Event)
//{
//    event.unwrappedName = name
//}
//
//func set(active: Bool, on event: Event)
//{
//    event.isActive = active
//}
//
//func link(condition: Condition, on event: Event)
//{
//    event.addToConditions(condition)
//}
//
//func conditionType(on event: Event) -> ConditionType
//{
//    event.conditionType
//}
//
//func conditions(on event: Event) -> [Condition]
//{
//    // TODO: This isn't ordererd... can we give each condition an index,
//    // or at least an added date?
//    event.unwrapped(\Event.conditions)
//}
//
//func flows(on event: Event) -> [Flow]
//{
//    // TODO: It needs an index as well, which is relative to the event
//    // that it's linked to... how can we determine this info?
//    event.unwrapped(\Event.flows)
//}
//
//func history(on event: Event) -> [History]
//{
//    event.unwrapped(\Event.history)
//}
//
//func pinState(on event: Event) -> PinState
//{
//    if event.isPinned {
//        return .pinned
//    } else {
//        return .unpinned
//    }
//}
