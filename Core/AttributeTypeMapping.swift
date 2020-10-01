//
//  AttributeTypeMapping.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation
import CoreData

struct AttributeTypeMapping
{
    static func attributeType(attributeClass: AnyClass) -> NSAttributeType
    {
        switch attributeClass {
        case is Int16.Type:
            return .integer16AttributeType
        case is Int32:
            return .integer32AttributeType
        case is Int64:
            return .integer64AttributeType
        case is Double:
            return .decimalAttributeType
        case is Float:
            return .floatAttributeType
        case is String:
            return .stringAttributeType
        case is Bool:
            return .booleanAttributeType
        case is Date:
            return .dateAttributeType
        case is Data:
            return .binaryDataAttributeType
        case is UUID:
            return .UUIDAttributeType
        case is URL:
            return .URIAttributeType
        default:
        // If the object is an object id
        // if the object is tranformable
        //    Transformable must have `attributeValueClassName` must be set, or the attribute class must implement NSCopying
        }
    }
}

/*
 case undefinedAttributeType = 0
 
 case integer16AttributeType = 100
 
 case integer32AttributeType = 200
 
 case integer64AttributeType = 300
 
 case decimalAttributeType = 400
 
 case doubleAttributeType = 500
 
 case floatAttributeType = 600
 
 case stringAttributeType = 700
 
 case booleanAttributeType = 800
 
 case dateAttributeType = 900
 
 case binaryDataAttributeType = 1000
 
 @available(iOS 11.0, *)
 case UUIDAttributeType = 1100
 
 @available(iOS 11.0, *)
 case URIAttributeType = 1200
 
 @available(iOS 3.0, *)
 case transformableAttributeType = 1800 // If your attribute is of NSTransformableAttributeType, the attributeValueClassName must be set or attribute value class must implement NSCopying.
 
 @available(iOS 3.0, *)
 case objectIDAttributeType = 2000
 */
