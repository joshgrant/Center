//
//  TableViewSectionHeader.swift
//  Architecture
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

public struct TableViewSectionHeaderModel
{
    var hasDisclosureTriangle: Bool = false
    var image: UIImage? = nil
    var title: String
    var hasSearchButton: Bool = false
    var hasLinkButton: Bool = false
    var hasAddButton: Bool = false
    var hasEditButton: Bool = false
}

public extension TableViewSectionHeaderModel
{
    init(title: String, icon: Icon)
    {
        self.title = title
        self.image = UIImage(systemName: icon.rawValue)
    }
}
