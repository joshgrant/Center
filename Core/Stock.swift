//
//  Stock.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import CoreData

/// A requirement of this protocol is that all properties are given default values if nil...
/// We need this to properly decode value types
protocol CoreDataObjectProtocol: class
{
    static var classProperties: [Property] { get }
    
    static var name: String { get }
    static var isAbstract: Bool { get }
    static var subentities: [NSEntityDescription] { get }
    static var coreDataProperties: [NSPropertyDescription] { get }
    
    static var entity: NSEntityDescription { get }
    
    // We need a default initializer with no parameters to easily create objects
    init()
}

extension CoreDataObjectProtocol
{
    static var classProperties: [Property]
    {
        Mirror(reflecting: Self()).children.map { Property(mirrorChild: $0) }
    }
    
    static var name: String { String(describing: Self.self) }
    
    static func makeEntity() -> NSEntityDescription
    {
        let entity = NSEntityDescription()
        entity.name = name
        entity.managedObjectClassName = name
        entity.superentity?.name = "Hello" // TODO: Maybe this could work?
        entity.isAbstract = isAbstract
        entity.subentities = subentities
        entity.properties = coreDataProperties
        return entity
    }
}

class Stock
{
    var amount: Double?
    
    required init()
    {
        amount = 0
    }
    
    init(amount: Double)
    {
        self.amount = amount
    }
    
//    var amountType: Any
//    var stateType: Any
//    var dimension: Any
//    
//    var currentAmount: Double
//    var currentState: Any
//    
//    var netAmount: Any
//    
//    var states: [Any]
//    
//    var inflows: [Any] // TODO: Cache
//    var outflows: [Any] // TODO: Cache
//    
//    var events: [Any] // TODO: Cache
//    var linkEvent: [Any]
//    var unlinkEvent: [Any]
//    
//    func getAmounts(from: Date, to: Date) -> [Any] { return [] }
//    
//    var history: [Any] // TODO: Cache
}

extension Stock: CoreDataObjectProtocol
{
    static let entity: NSEntityDescription = { makeEntity() }()
    static var isAbstract: Bool { false }
    static var subentities: [NSEntityDescription] { [] }
    static var coreDataProperties: [NSPropertyDescription] {
        // This needs to get the class and then break apart the properties
//        for property in classProperties {
//            switch property.value {
//            case is AnyCollection<Any>:
//                // Create a new relationship
//                break
//            case is Bool:
//                break
//            case is Int16:
//                break
//            case is Int32:
//                break
//            case is Int64:
//                break
//            case is String:
//                break
//            default:
//                print(property)
//            }
//        }
        
        print(classProperties)
        print(Mirror(reflecting: Stock()).children)
        
        let value = classProperties.first?.value
        
        switch value {
        case is Int:
            print("TERRIzble")
        case is Double:
            print("GOOD")
        case is Int?:
            print("BAD 2")
        case is Double?:
            print("OKAY")
        default:
            print("BAD")
        }
        
        return []
    }
    
    static func makePropertyDescription(property: Property) -> NSPropertyDescription
    {
        switch property.value
        {
        case is Int16:
            return Int16.makePropertyDescription(name: property.label)
        default:
            break // throws an error
        }
    }
}

extension Int16
{
    static var defaultValue: Int16 { 0 }
    
    static func makePropertyDescription(name: String, isOptional: Bool = false) -> NSPropertyDescription
    {
        let attributeDescription = NSAttributeDescription()
        attributeDescription.name = name
        attributeDescription.defaultValue = defaultValue
        attributeDescription.attributeType = .integer16AttributeType
        attributeDescription.isOptional = isOptional
        return attributeDescription
    }
}

