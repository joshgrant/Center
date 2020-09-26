//
//  Object.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

class Object: NSManagedObject
{
    
}

extension Object: EntityConstructionProtocol
{
    static var entity: NSEntityDescription
    {
        let entity = NSEntityDescription()
        entity.name = String(describing: Self.self)
        entity.subentities = [
            Symbol.entity,
            Event.entity,
            Flow.entity,
            History.entity
        ]
        
        entity.properties = [
        ]
        
        return entity
    }
}

extension Object: ObjectProtocol
{
    func getSymbol() -> SymbolProtocol
    {
        return Symbol()
    }
    
    func setSymbol(_ symbol: SymbolProtocol)
    {
        
    }
    
    func getNotes() -> [NoteProtocol]
    {
        return []
    }
    
    func linkNote(_ note: NoteProtocol)
    {
        
    }
    
    func getNotesCount() -> Int
    {
        return 0
    }
}
