//
//  TableViewSectionHeader.swift
//  Architecture
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

public struct TableViewHeaderModel
{
    public var hasDisclosureTriangle: Bool = false
    public var image: UIImage? = nil
    public var title: String
    public var hasSearchButton: Bool = false
    public var hasLinkButton: Bool = false
    public var hasAddButton: Bool = false
    public var hasEditButton: Bool = false
}

public extension TableViewHeaderModel
{
    init(title: String, icon: Icon)
    {
        self.title = title
        self.image = UIImage(systemName: icon.rawValue)
    }
}
