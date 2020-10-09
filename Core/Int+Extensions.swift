//
//  Int+Extensions.swift
//  Core
//
//  Created by Joshua Grant on 10/9/20.
//

import Foundation

public extension Int
{
    @inlinable func map<T>(_ transform: () throws -> T) rethrows -> [T]
    {
        try Array(repeating: (), count: self).map {
            try transform()
        }
    }
}
