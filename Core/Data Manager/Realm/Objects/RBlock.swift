//
//  RBlock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RBlock: Object, Block
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var url: URL?
    @objc dynamic public var mainColor: Color?
    @objc dynamic public var tintColor: Color?
    @objc dynamic public var backgroundColor: Color?
    
    // TODO: Cache
    public func relatedNotes() -> [Note]
    {
        // To get the related notes, we need to run a computation on all of the notes,
        // store the result in the database, and then query this result. Of course,
        // this computation should be cached and updated as new notes are inserted.
        
        // How does this look?
//        let predicate = NSPredicate(format: "", <#T##args: CVarArg...##CVarArg#>)
//        realm?.objects(RNote.self).filter(predicate)
        return []
    }
}
