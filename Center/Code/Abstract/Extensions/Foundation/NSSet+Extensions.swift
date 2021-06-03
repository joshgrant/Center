//
//  NSSet+Extensions.swift
//  Center
//
//  Created by Joshua Grant on 6/3/21.
//

import Foundation

extension NSSet
{
    func toArray<T>() -> [T]
    {
        self.compactMap { $0 as? T }
    }
}
