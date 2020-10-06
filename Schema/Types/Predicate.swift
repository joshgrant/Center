//
//  Predicate.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public enum Predicate: Int16
{
    case lessThan
    case lessThanOrEqualTo
    case equal
    case greaterThanOrEqualTo
    case greaterThan
    case notEqual
    case didChange
    case didNotChange
}

extension Predicate: FallbackProtocol
{
    static let fallback: Predicate = .equal
}
