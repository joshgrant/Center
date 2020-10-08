//
//  FlowDetailInteractor.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import Schema

// TODO: have this protocol inherit from "EventStorage" and "HistoryStorage" protocol
protocol FlowDetailInteractorProtocol
{
    func pin()
    func unpin()
    func run()
    func stop()
    
    func selectAmount()
    func selectFrom()
    func selectTo()
    func selectDuration()
    func toggleUserCompletion()
    
    func selectEvent(event: Event)
    
    func selectHistory(history: History)
}
