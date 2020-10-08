//
//  LibraryListCell.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import Architecture

class LibraryListCell: TableViewCell
{
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? LibraryListCellModel else {
            assertionFailure("Failed to configure \(self) with \(viewModel)")
            return
        }
        
        self.accessoryType = .disclosureIndicator
        
        self.imageView?.image = model.image
        self.imageView?.tintColor = .systemGray
        
        self.textLabel?.text = model.title
    }
}
