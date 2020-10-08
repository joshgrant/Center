//
//  EventListCell.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import UIKit
import Architecture

class EventListCell: TableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? EventListCellModel else {
            assertionFailure("Failed to configure \(self) with \(viewModel)")
            return
        }
        
        self.separatorInset = .zero
        self.accessoryType = .disclosureIndicator
        
        self.textLabel?.font = .systemFont(ofSize: 17)
        self.textLabel?.textColor = .black
        self.textLabel?.text = model.title
        
        self.detailTextLabel?.font = .systemFont(ofSize: 15)
        self.detailTextLabel?.textColor = .systemGray
        self.detailTextLabel?.text = model.detail
    }
}
