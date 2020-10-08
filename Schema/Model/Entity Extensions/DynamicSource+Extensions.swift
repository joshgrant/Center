//
//  DynamicSource+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public extension DynamicSource
{
    var sourceType: SourceType {
        get {
            SourceType(rawValue: sourceTypeRaw) ?? .fallback
        }
        set {
            sourceTypeRaw = newValue.rawValue
        }
    }
}

public extension DynamicSource
{
    override var computedValue: Any {
        switch sourceType {
        case .date:
            return Date().timeIntervalSince1970
        default:
            return Double.zero
        }
    }
}
