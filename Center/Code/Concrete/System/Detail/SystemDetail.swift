//
//  SystemDetail.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit

func makeSystemDetailTitleEditCellModel(system: System) -> TitleEditCellModel
{
    return TitleEditCellModel(text: system.unwrappedName, placeholder: "Name")
}

func makeSystemDetailIdealCellModel(system: System) -> IdealCellModel
{
    let ideal = system.ideal?.computedValue as? Double ?? 0
    return IdealCellModel(value: ideal)
}

func makeSystemDetailTableViewDataSourceModels(system: System) -> [[TableViewCellModel]]
{
    // Section 1
    // Text cell
    // ideal cell
    // Suggested flows
    
    // Stocks
    // Flows
    // Events
    // Notes
    
    // Todo, could break this up into functions...
    
    return [
        [
            makeSystemDetailTitleEditCellModel(system: system),
            makeSystemDetailIdealCellModel(system: system)
        ],
        [],
        [],
        [],
        [],
        []
    ]
}
