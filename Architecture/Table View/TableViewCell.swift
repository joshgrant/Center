//
//  TableViewCell.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

open class TableViewCell: UITableViewCell {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("Load this view programmatically")
    }
}
