//
//  Flow.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

@objc public protocol Flow:
    Entity,
    Named,
    EventStorage,
    HistoryStorage,
    NoteStorage
{
    var contactDelegate: Contact? { get set }
}
