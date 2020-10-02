//
//  Symbol.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc protocol Symbol
{
    var name: String { get set }
    
    /// Returns each object that uses this symbol as a name value
    /// The concrete instance of symbol should define a `List<Entity>` property
    func references() -> [Entity]
    
    /// Returns each object that links to this entity
    func links() -> [Entity]
    
    /// Adds a link to this symbol
    func add(link: Entity)
    
    /// Returns the notes associated with this symbol
    func notes() -> [Note]
    
    /// Adds a note to the symbol
    func add(note: Note)
    
    /// Unlinks the given note from the symbol
    func unlink(note: Note)
}
