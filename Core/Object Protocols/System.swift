//
//  System.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation

public protocol System:
    Entity,
    Named,
    NoteStorage,
    StockStorage,
    FlowStorage,
    EventStorage,
    Pinnable
{
    func percentIdeal() -> Double
    func suggestedFlows() -> [Flow]
}
