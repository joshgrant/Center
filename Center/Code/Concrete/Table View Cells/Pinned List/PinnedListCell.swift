//
//  PinnedListCell.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

class PinnedListCell: TableViewCell
{
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? PinnedListCellModel else {
            assertionFailure("Failed to configure \(self) with \(viewModel)")
            return
        }
        
        self.accessoryType = .disclosureIndicator
        
        self.textLabel?.text = model.title
    }
}
