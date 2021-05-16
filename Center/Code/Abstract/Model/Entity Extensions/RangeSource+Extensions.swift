//
//  RangeSource+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public extension RangeSource
{
    override var computedValue: Any {
        return min ... max
    }
}
