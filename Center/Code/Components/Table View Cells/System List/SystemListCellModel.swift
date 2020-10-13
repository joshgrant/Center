//
//  SystemListCellModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

struct SystemListCellModel
{
    var title: String
    var percentIdeal: Double
}

func subtitleForSystemListCellModel(_ cellModel: SystemListCellModel) -> String
{
    // TODO: Check the formatting for this...
    "\(cellModel.percentIdeal)% ideal"
}
