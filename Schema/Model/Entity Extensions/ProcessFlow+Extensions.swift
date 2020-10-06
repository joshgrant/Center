//
//  ProcessFlow+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation

extension ProcessFlow
{
    var completionType: CompletionType
    {
        get {
            CompletionType(rawValue: completionTypeRaw) ?? .fallback
        }
        set {
            completionTypeRaw = newValue.rawValue
        }
    }
    
    var completionOrder: Order
    {
        get {
            Order(rawValue: completionOrderTypeRaw) ?? .fallback
        }
        set {
            completionOrderTypeRaw = newValue.rawValue
        }
    }
}
