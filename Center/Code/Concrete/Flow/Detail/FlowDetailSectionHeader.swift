//
//  FlowDetailSectionHeader.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import UIKit

enum FlowDetailSectionHeader: Int, CaseIterable
{
    case info
    case events
    case notes
    case history
}

func title(flowDetailSectionHeader: FlowDetailSectionHeader) -> String
{
    switch flowDetailSectionHeader
    {
    case .info:
        return "Info"
    case .events:
        return "Events"
    case .notes:
        return "Notes"
    case .history:
        return "History"
    }
}

func image(flowDetailSectionHeader: FlowDetailSectionHeader) -> Icon?
{
    return nil
}
