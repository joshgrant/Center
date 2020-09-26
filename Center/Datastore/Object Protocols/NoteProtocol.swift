//
//  NoteProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol NoteProtocol: ObjectProtocol
{
    func getNoteBlocks() -> [Any]
    func appendNoteBlock(_ noteBlock: Any)
    
    func getLinks() -> [Any]
    func addLink(_ link: Any)
    
    func getRelatedNotes() -> [NoteProtocol]
    
    // MARK: - Caching
    
    func getFirstLine() -> String?
    func getSecondLine() -> String?
    func getThumbnailImage() -> Any?
    
    func getLinksCount() -> Int
    func getRelatedNotesCount() -> Int
}
