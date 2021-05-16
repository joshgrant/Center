//
//  LibraryStateMachine.swift
//  Center
//
//  Created by Joshua Grant on 10/20/20.
//

import Foundation

enum LibraryState: String, Codable
{
    case normal
    case searching
    case scrolling
    case transitioningToDetail
}

class LibraryStateMachine: StateMachine<LibraryState>
{
    
}
