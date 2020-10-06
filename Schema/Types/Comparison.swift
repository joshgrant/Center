//
//  Predicate.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public typealias Comparison = NSComparisonPredicate.Operator

extension Comparison: FallbackProtocol
{
    static let fallback: Comparison = .equalTo
}
