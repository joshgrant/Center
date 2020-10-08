//
//  EventTableViewCell.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

class EventTableViewCell: TableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let style = UITableViewCell.CellStyle.subtitle
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        self.separatorInset = .zero
        self.accessoryType = .disclosureIndicator
        
        self.textLabel?.font = .systemFont(ofSize: 17)
        self.textLabel?.textColor = .black
        
        self.detailTextLabel?.font = .systemFont(ofSize: 15)
        self.detailTextLabel?.textColor = .systemGray2
        
        self.textLabel?.text = "Birthday Party"
        self.detailTextLabel?.text = "Mon, Apr 1, 12:00"
    }
}
