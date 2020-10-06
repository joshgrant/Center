//
//  DataManagerProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/25/20.
//

import Foundation

public protocol DataManagerProtocol
{
    func save()
    func undo()
    func redo()
    
    func erase() throws
    
    func populate()
}
