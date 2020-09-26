//
//  EventTableViewCell.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit
import Architecture

class EventTableViewCell: TableViewCell
{
    init()
    {
        super.init(style: .subtitle, reuseIdentifier: String(describing: Self.self))
        
        self.textLabel?.text = "Birthday Party"
        self.detailTextLabel?.text = "Mon, Apr 1, 12:00"
    }
}
