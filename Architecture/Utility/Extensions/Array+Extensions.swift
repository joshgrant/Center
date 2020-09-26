//
//  Array+Extensions.swift
//  Architecture
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

extension Array where Element: Hashable
{
    func uniques() -> [Element]
    {
        return Array(Set<Element>(self))
    }
}
