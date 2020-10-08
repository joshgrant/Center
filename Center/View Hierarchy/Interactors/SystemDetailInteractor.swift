//
//  SystemDetailInteractor.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import Schema

protocol SystemDetailInteractor
{
    func goBack() // TODO: Implement go back protocol
    func duplicate()
    func pin()
    func unpin()
    func delete() // TODO: Implement delete protocol
    
    func openIdealInfoPanel()
    
    func activateSuggestedFlow(_ flow: Flow)
    
    // TODO: Stock section protocol
    func showStocks()
    func hideStocks()
    func linkStock()
    func unlinkStock()
    func addStock()
    
    // TODO: Flow section protocol
    func showFlows()
    func hideFlows()
    func linkFlow()
    func unlinkFlow()
    func addFlow()
    
    // TODO: Event section protocol
    func showEvents()
    func hideEvents()
    func linkEvent()
    func unlinkEvent()
    func addEvent()
    
    // TODO: Notes section protocol
    func showNotes()
    func hideNotes()
    func linkNote()
    func unlinkNote()
    func addNote()
}
