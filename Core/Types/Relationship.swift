//
//  Relationship.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc public enum Relationship: Int, RealmEnum
{
    case direct
    case inverse
}
