//
//  TitleEditCell.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import UIKit

class TitleEditCell: TableViewCell
{
    // TODO: Title began editing
    // TODO: Title ended editing
    // TODO: Title changed text
    
    var textField: UITextField
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        textField = UITextField()
        
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier)
        
        let contentStackView = UIStackView(arrangedSubviews: [textField])
        set(height: 44, on: contentStackView)
        
        contentView.embed(
            contentStackView,
            padding: .init(
                top: 0,
                left: 16,
                bottom: 0,
                right: 5),
            bottomPriority: .defaultLow)
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel)
    {
        guard let model = viewModel as? TitleEditCellModel else {
            assertionFailure("Cell model: \(viewModel)")
            return
        }
        
        textField.text = model.text
    }
}
