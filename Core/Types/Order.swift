//
//  Order.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation
import RealmSwift

@objc public enum Order: Int, RealmEnum
{
    case sequential
    case parallel
    case independent
}
