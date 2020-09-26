//
//  NoteBlockProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol NoteBlockProtocol
{
    func getContent() -> NoteBlockContentProtocol
    func getStyle() -> Any
    func getColor() -> Any
    func getURL() -> Any
    func getRelatedNotes() -> [NoteOverviewProtocol]
}

protocol NoteBlockContentProtocol
{
    // We have text, image, and table
    // Each of these needs to conform to the same protocol...
    // But how?  
}
