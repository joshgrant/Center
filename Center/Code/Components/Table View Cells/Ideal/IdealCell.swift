//
//  IdealCell.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit

class IdealCell: TableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? IdealCellModel else {
            assertionFailure("Cell model: \(viewModel)")
            return
        }
        
        accessoryType = .detailDisclosureButton
        
        textLabel?.text = model.title
        detailTextLabel?.text = model.value.percentFormatted
    }
}
