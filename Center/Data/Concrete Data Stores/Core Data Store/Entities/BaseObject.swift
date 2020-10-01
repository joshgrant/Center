//
//  BaseObject.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

@objc(BaseObject)
public class BaseObject: NSManagedObject
{
    @NSManaged var title: Symbol
    @NSManaged var notes: Set<Note>
    
    public override class func entity() -> NSEntityDescription
    {
        return CoreDataEntityManager.objectEntity
    }
}

extension BaseObject: ObjectProtocol
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
