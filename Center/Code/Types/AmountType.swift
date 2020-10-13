//
//  AmountType.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public enum AmountType: Int16
{
    case integer
    case decimal
    case boolean
}

extension AmountType: FallbackProtocol
{
    static let fallback: AmountType = .integer
}
