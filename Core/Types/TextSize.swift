//
//  TextSize.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc public enum TextSize: Int, RealmEnum
{
    case header
    case sectionTitle
    case body
    case caption
}
