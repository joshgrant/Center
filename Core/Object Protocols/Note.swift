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
    NoteStorage,
    Pinnable
{
    /// The concrete instance of symbol should define a `List<Block>` property
    func blocks() -> [Block]
    func append(block: Block) throws
    func remove(block: Block) throws
    
    // MARK: - Caching
    
    func getFirstLine() -> String?
    func getSecondLine() -> String?
    func getThumbnailImage() -> Any?
}
