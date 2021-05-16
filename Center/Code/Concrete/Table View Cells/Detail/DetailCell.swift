//
//  DetailCell.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import UIKit

class DetailCell: TableViewCell
{
    var titleLabel: UILabel
    var detailLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        titleLabel = UILabel()
        detailLabel = UILabel()
        
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier)
        
        let contentStackView = UIStackView(arrangedSubviews: [titleLabel, detailLabel])
        set(height: 44, on: contentStackView)
        
        contentView.embed(
            contentStackView,
            padding: .init(
                top: 0,
                left: 16,
                bottom: 0,
                right: 16),
            bottomPriority: .defaultLow)
    }
    
    override func configureWithViewModel(_ viewModel: TableViewCellModel) {
        guard let model = viewModel as? DetailCellModel else {
            assertionFailure("Cell model: \(viewModel)")
            return
        }
        
        titleLabel.text = model.title
        detailLabel.text = model.detail
    }
}
