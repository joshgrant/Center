//
//  SystemListCellModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

public struct SystemListCellModel
{
    var title: String
    var percentIdeal: Double
}

extension SystemListCellModel: TableViewCellModel
{
    public static var cellClass: AnyClass {
        SystemListCell.self
    }
}

extension Numeric
{
    var percentFormatted: String
    {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        formatter.numberStyle = .percent
        return formatter.string(for: self) ?? ""
    }
}
