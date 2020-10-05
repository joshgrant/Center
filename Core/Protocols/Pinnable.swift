//
//  Pinnable.swift
//  Core
//
//  Created by Joshua Grant on 10/5/20.
//

import Foundation

@objc public protocol Pinnable
{
    var isPinned: Bool { get set }
}
