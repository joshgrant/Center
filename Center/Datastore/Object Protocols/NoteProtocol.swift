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
    
    func getRelatedNotes() -> [NoteOverviewProtocol]
}

protocol NoteOverviewProtocol
{
    func getFirstLine() -> String
    func getSecondLine() -> String
    
    // A thumbnail to show if the note has any url's, images, videos inside of it
    func getThumbnailImage() -> Any
}
