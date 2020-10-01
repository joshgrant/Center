//
//  PropertyModel.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation

class PropertyModel: Codable
{
    var key: String { get set }
    var type: ValueType { get set }
}

class Property: Codable
{
    var
}

protocol PropertyModel: Codable
{
    var key: String { get set }
    var valueType: ValueType { get set }
    var value: Any { get set }
}

enum ValueType: Int
{
    case bool
    case int
    case double
    case string
    case binary
    case date
    case json
}
