//
//  List.swift
//  Center
//
//  Created by Joshua Grant on 5/16/21.
//

import CoreData

func getItemsForList<T: NSManagedObject>(context: Context, type: T.Type) -> [T]
{
    let fetchRequest: NSFetchRequest<T> = NSFetchRequest(entityName: NSStringFromClass(T.self))
    do {
        return try context.fetch(fetchRequest)
    } catch {
        assertionFailure(error.localizedDescription)
        return []
    }
}

func getItemInList<T: NSManagedObject>(at indexPath: IndexPath, context: Context, type: T.Type) -> T?
{
    let items = getItemsForList(context: context, type: type)
    return items[indexPath.row]
}
