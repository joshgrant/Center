//
//  ConditionType.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public enum ConditionType: Int16
{
    case all
    case any
}

extension ConditionType: FallbackProtocol
{
    static let fallback: ConditionType = .all
}
