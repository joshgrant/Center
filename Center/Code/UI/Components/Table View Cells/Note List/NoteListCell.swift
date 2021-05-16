//
//  NoteListCell.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit

class NoteListCell: TableViewCell
{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? NoteListCellModel else {
            assertionFailure("Cell model: \(viewModel)")
            return
        }
        
        accessoryType = .disclosureIndicator
        
        textLabel?.text = model.title
        detailTextLabel?.text = model.subtitle
    }
}
