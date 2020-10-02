//
//  AmountType.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc public enum AmountType: Int, RealmEnum
{
    case Integer
    case Decimal
    case Boolean
}
