//
//  Priority.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc public enum Priority: Int, RealmEnum
{
    case linear
    case quadratic
    case exponential
}
