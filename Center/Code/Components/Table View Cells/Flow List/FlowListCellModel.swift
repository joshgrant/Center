//
//  FlowListCellModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

struct FlowListCellModel
{
    var title: String
    var fromName: String
    var toName: String
    var flowAmount: Double?
}

func subtitleForFlowListCellModel(_ cellModel: FlowListCellModel) -> String
{
    return "\(cellModel.fromName) 􀄫 \(cellModel.toName)"
}

func detailLabelForFlowListCellModel(_ cellModel: FlowListCellModel) -> String?
{
    // TODO: Check formatting
    guard let flowAmount = cellModel.flowAmount else {
        return nil
    }
    
    return "\(flowAmount) \(cellModel.fromName)"
}
