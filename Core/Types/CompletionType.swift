//
//  CompletionType.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation
import RealmSwift

@objc public enum CompletionType: Int, RealmEnum
{
    // TODO: Not sure which completion type suits them all
    case children
    case boolean
}
