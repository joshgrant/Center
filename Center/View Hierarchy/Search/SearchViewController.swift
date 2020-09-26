//
//  SearchViewController.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit
import Architecture

// TODO: This needs to be instantiated with context -
// i.e what are the relevant filters that should be applied?
// when searching to link an item, it should have a filter for that item type...
// If the context isn't "link", then the context is "open" which takes the user
// to the selected item...

class SearchViewController: ViewController
{
    override init()
    {
        super.init()
    }
    
    override func loadView()
    {
        let view = UIView()
        
        view.backgroundColor = .green
        
        self.view = view
    }
}

//extension SearchViewController: UISearchContainerViewController
