//
//  Source+Extensions.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public extension Source
{
    @objc var computedValue: Any
    {
        assertionFailure("Override this property in your subclass")
        return -1
    }
}

extension Source
{
    public override var description: String
    {
        return "\(computedValue)"
    }
}
