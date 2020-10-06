//
//  Relationship.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public enum Relationship: Int16
{
    case direct
    case inverse
}

extension Relationship: FallbackProtocol
{
    static let fallback: Relationship = .direct
}
