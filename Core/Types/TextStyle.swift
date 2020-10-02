//
//  TextStyle.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc public enum TextStyle: Int, RealmEnum
{
    case bold
    case italic
    case boldItalic
    case normal
}
