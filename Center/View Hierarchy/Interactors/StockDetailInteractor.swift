//
//  StockDetailInteractor.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import Schema

protocol StockDetailInteractor
{
    func goBack()
    func pin()
    func unpin()
    
    func beginEditingTitle()
    func endEditingTitle()
    
    func openTypeDetail()
    func openDimensionDetail()
    func openCurrentDetail()
    func openNetInfoPanel()
    
    func select(state: State)
    func openStatesList()
    func closeStatesList()
    func editStatesList()
    
    func select(inflow: Flow)
    func select(outflow: Flow)
    
    func openEventsList()
    func closeEventsList()
    func linkEvents()
    func unlink(event: Event)
    func select(event: Event)
    
    func openNotesList()
    func closeNotesList()
    
    func linkNotes()
    func unlink(note: Note)
    func select(note: Note)
}
