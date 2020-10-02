//
//  Entity.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc protocol Entity
{
    var id: UUID { get }
    var symbol: Symbol? { get set }
    
    /// The concrete instance of symbol should define a `List<Note>` property
    func notes() -> [Note]
    
    func link(note: Note)
    func unlink(note: Note)
}
