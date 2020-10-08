//
//  Named.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public protocol Named: class
{
    var name: Symbol? { get set }
    var unwrappedName: String? { get set }
    var managedObjectContext: Context? { get }
}

public extension Named
{
    var unwrappedName: String? {
        get {
            name?.name
        }
        set {
            if let name = name {
                name.name = newValue
            } else {
                guard let context = self.managedObjectContext else {
                    assertionFailure("Failed to add the name to the event because the event has no context")
                    return
                }
                
                name = Symbol(context: context, name: newValue)
            }
        }
    }
}
