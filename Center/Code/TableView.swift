//
//  TableView.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

open class TableView: UITableView
{
    var model: TableViewModel?
    
    public override init(frame: CGRect, style: UITableView.Style)
    {
        super.init(frame: frame, style: style)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder)
    {
        fatalError("Load this view programmatically")
    }
}
