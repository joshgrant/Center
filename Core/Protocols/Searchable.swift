//
//  Searchable.swift
//  Core
//
//  Created by Joshua Grant on 10/5/20.
//

import Foundation

@objc public protocol Searchable
{
    static func predicate(for queryString: String) -> NSPredicate
}
