//
//  REntity.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class REntity: Object, Entity
{
    @objc dynamic public var id: UUID = .init()
    
    public var linkedNotes = LinkingObjects(fromType: RNote.self, property: "_links")
}
