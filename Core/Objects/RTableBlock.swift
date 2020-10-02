//
//  RTableBlock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RTableBlock: Object, TableBlock
{
    @objc dynamic public var url: URL?
    @objc dynamic public var mainColor: Color?
    @objc dynamic public var tintColor: Color?
    @objc dynamic public var backgroundColor: Color?
    
    // TODO: Cache
    public func relatedNotes() -> [Note] {
        []
    }
}
