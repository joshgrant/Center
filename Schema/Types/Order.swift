//
//  Order.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

public enum Order: Int16
{
    case sequential
    case parallel
    case independent
}

extension Order: FallbackProtocol
{
    static let fallback: Order = .sequential
}
