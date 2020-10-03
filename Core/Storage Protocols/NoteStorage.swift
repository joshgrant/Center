//
//  NoteStorage.swift
//  Core
//
//  Created by Joshua Grant on 10/3/20.
//

import Foundation

@objc public protocol NoteStorage
{
    func notes() -> [Note]
    func append(note: Note) throws
    func remove(note: Note) throws
}
