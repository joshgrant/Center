//
//  Unit.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Unit:
    Entity,
    Named,
    NoteStorage
{
    var isBaseUnit: Bool { get set }
    var relativeTo: Unit? { get set }
    var ratio: Ratio? { get set }
}
