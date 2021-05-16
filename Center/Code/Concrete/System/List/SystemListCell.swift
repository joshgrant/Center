//
//  SystemListCell.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit

// TODO: So much code duplication potential here (with cell configuration) - maybe
// a way to create cells with the proper information?

class SystemListCell: TableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? SystemListCellModel else {
            assertionFailure("Failed to configure \(self) with \(viewModel)")
            return
        }
        
        self.accessoryType = .disclosureIndicator
        
        self.textLabel?.text = model.title
        
        self.detailTextLabel?.font = .systemFont(ofSize: 15)
        self.detailTextLabel?.textColor = .systemGray
        self.detailTextLabel?.text = model.percentIdeal.percentFormatted
    }
}
