//
//  IdealCellModel.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import Foundation

struct IdealCellModel
{
    var title: String = "Ideal"
    var value: Double
    // TODO: The info button was tapped?
}

extension IdealCellModel: TableViewCellModel
{
    static var cellClass: AnyClass
    {
        IdealCell.self
    }
}
