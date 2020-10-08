//
//  Predicate.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public enum Comparison: Int16
{
    case equal
    case notEqual
    case greaterThan
    case lessThan
    case greaterThanOrEqual
    case lessThanOrEqual
    
    /// Number is in the range `0 ..< 100`, for example
    case inTheRange
    
    /// String begins with "He", for example
    case beginsWith
    
    /// String ends with "llo", for example
    case endsWith
    
    /// String contains "foo"
    case contains
    
    /// String does not contain "bar"
    case doesNotContain
    
    /// Enum value doesn't exist
    case exists
    
    /// Enum value exists
    case doesNotExist
    
    /// After the 3rd of March, for example
    case after
    
    /// Before the 21st of December, for example
    case before
    
    /// In the last 6 hours, for example
    case inTheLast
    
    /// Not in the last 7 days, for example
    case notInTheLast
}

extension Comparison: FallbackProtocol
{
    static let fallback: Comparison = .equal
}
