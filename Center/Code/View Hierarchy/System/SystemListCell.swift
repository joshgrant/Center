//
//  SystemListCell.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import Foundation

class SystemListCell: TableViewCell
{
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? SystemListCellModel else {
            assertionFailure("Failed to configure \(self) with \(viewModel)")
            return
        }
        
        self.textLabel?.text = model.title
        self.detailTextLabel?.text = "\(model.percentIdeal)" // TODO: formatting?
    }
}
