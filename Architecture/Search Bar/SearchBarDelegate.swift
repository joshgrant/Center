//
//  SearchBarDelegate.swift
//  Architecture
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

public typealias SearchBarDelegateType =
    NSObject
    & UISearchBarDelegate

public protocol SearchBarDelegate: SearchBarDelegateType
{
    func configure(searchBar: UISearchBar)
}

public extension SearchBarDelegate
{
    func configure(searchBar: UISearchBar)
    {
        searchBar.delegate = self
    }
}
