//
//  StockDetailViewModel.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

struct StockDetailViewModel
{
    var pinned: Bool
    
    var title: String
    var type: String // Decimal, State machine??
    var dimension: String
    var current: String
    var currentState: String // ?? Do we need a sub-class for this?
    var net: String
    
    var states: [StateListCellModel]
    
    var inflows: [FlowListCellModel]
    var outflows: [FlowListCellModel]
    
    var eventsShowing: Bool
    var events: [EventListCellModel]
    
    var notesShowing: Bool // TODO: A protocol if it has notes?
    var notes: [NoteListCellModel]
}
