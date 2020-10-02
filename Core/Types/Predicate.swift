//
//  Predicate.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc public enum Predicate: Int, RealmEnum
{
    case lessThan
    case lessThanOrEqualTo
    case equal
    case greaterThanOrEqualTo
    case greaterThan
    case notEqual
    case didChange
    case didNotChange
}
