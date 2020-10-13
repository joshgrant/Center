//
//  FlowListCell.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit

class FlowListCell: TableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // TODO: Create and add the views in the init method...
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? FlowListCellModel else {
            assertionFailure("Cell model: \(viewModel)")
            return
        }
        
        textLabel?.text = model.title
        detailTextLabel?.text = subtitleForFlowListCellModel(model)
        
        // TODO: Set the right detail label, which isn't possible with a non-custom cell
    }
}
