//
//  Library.swift
//  Center
//
//  Created by Joshua Grant on 10/10/20.
//

import UIKit

func makeLibraryRootViewControllerSelectionClosure(controller: ViewController, context: Context) -> TableViewSelectionClosure
{
    return { selection in
        
        let entityType = EntityType.libraryVisible[selection.indexPath.row]
        
        let page = Page(kind: entityType, modifier: .list)
        
        let detailViewController = makeListController(
            page: page,
            context: context)
        
        controller
            .navigationController?
            .pushViewController(detailViewController, animated: true)
        
        selection.tableView.deselectRow(at: selection.indexPath, animated: true)
        
        // TODO: Use a state change to the app state, rather than the above statements
        return
    }
}

func makeLibraryCellModel(for entityType: EntityType, context: Context) -> LibraryCellModel
{
    LibraryCellModel(
        image: entityType.icon.getImage(),
        title: entityType.title,
        count: entityType.count(in: context))
}
