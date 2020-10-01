//
//  Symbol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

@objc(Symbol)
public class Symbol: NSManagedObject
{
    @NSManaged var stringValue: String
    @NSManaged var events: Set<Event>
    
    public override class func entity() -> NSEntityDescription
    {
        return CoreDataEntityManager.symbolEntity
    }
}

extension Symbol: SymbolProtocol
{
    func getStringValue() -> String {
        return ""
    }
    
    func setStringValue(_ stringValue: String) {
        
    }
    
    func getDirectReferences() -> [Any] {
        return []
    }
    
    func getLinks() -> [Any] {
        return []
    }
    
    func addLink(_ link: Any) {
        
    }
    
    func getNotes() -> [NoteProtocol] {
        return []
    }
    
    func linkNote(_ note: NoteProtocol) {
        
    }
    
    func getLinksCount() -> Int {
        return 0
    }
    
    func getNotesCount() -> Int {
        return 0
    }
}
