//
//  SearchViewModel.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

struct SearchViewModel
{
    var searchText: String
    
    var searchViewType: SearchViewType
    var selectedFilters: [Filter]
    
    var searchResults: [SearchResultListCellModel]
}
