//
//  EventDetailViewModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

struct EventDetailViewModel
{
    var title: String
    var isActive: Bool
    
    var completionType: String
    var conditions: [ConditionListCellModel]
}
