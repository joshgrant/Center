//
//  Note.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject
{
    @NSManaged var content: String // TODO: Temporary
    
    public override class func entity() -> NSEntityDescription
    {
        return CoreDataEntityManager.noteEntity
    }
}

extension Note: NoteProtocol
{
    func getNoteBlocks() -> [Any] {
        return []
    }
    
    func appendNoteBlock(_ noteBlock: Any) {
        
    }
    
    func getLinks() -> [Any] {
        return []
    }
    
    func addLink(_ link: Any) {
        
    }
    
    func getRelatedNotes() -> [NoteProtocol] {
        return []
    }
    
    func getFirstLine() -> String? {
        return "Test"
    }
    
    func getSecondLine() -> String? {
        return "Bomb"
    }
    
    func getThumbnailImage() -> Any? {
        return nil
    }
    
    func getLinksCount() -> Int {
        return 0
    }
    
    func getRelatedNotesCount() -> Int {
        return 0
    }
    
    func getSymbol() -> SymbolProtocol {
        return Symbol()
    }
    
    func setSymbol(_ symbol: SymbolProtocol) {
        
    }
    
    func getNotes() -> [NoteProtocol] {
        return []
    }
    
    func linkNote(_ note: NoteProtocol) {
        
    }
    
    func getNotesCount() -> Int {
        return 0
    }
}
