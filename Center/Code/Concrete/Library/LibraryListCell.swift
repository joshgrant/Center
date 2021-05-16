//
//  LibraryCell.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import UIKit

class LibraryCell: TableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? LibraryCellModel else {
            assertionFailure("Failed to configure \(self) with \(viewModel)")
            return
        }
        
        self.accessoryType = .disclosureIndicator
        
        self.imageView?.image = model.image
        self.imageView?.tintColor = .systemGray
        
        self.textLabel?.text = model.title
        
        self.detailTextLabel?.text = "\(model.count)"
    }
}
