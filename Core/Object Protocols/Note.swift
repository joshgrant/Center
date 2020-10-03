//
//  Note.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Note:
    Entity,
    LinkStorage,
    NoteStorage
{
    /// The concrete instance of symbol should define a `List<Block>` property
    func blocks() -> [Block]
    func append(block: Block) throws
    func remove(block: Block) throws
    
    func relatedNotes() -> [Note]
    
    // MARK: - Caching
    
    func getFirstLink() -> String?
    func getSecondLine() -> String?
    func getThumbnailImage() -> Any?
}
