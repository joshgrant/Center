//
//  Note.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Note: Entity
{
    /// The concrete instance of symbol should define a `List<Block>` property
    func blocks() -> [Block]
    func add(block: Block)
    func delete(block: Block)
    
    /// The concrete instance of symbol should define a `List<Entity>` property
    func links() -> [Entity]
    func link(entity: Entity)
    func unlink(entity: Entity)
    
    func relatedNotes() -> [Note]
    
    // MARK: - Caching
    
    func getFirstLink() -> String?
    func getSecondLine() -> String?
    func getThumbnailImage() -> Any?
    
    func linksCount() -> Int
    func relatedNotesCount() -> Int
}
