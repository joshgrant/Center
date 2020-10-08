//
//  UpcomingEvents.swift
//  Schema
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation
import CoreData

func makeUpcomingEventsPredicate() -> NSPredicate
{
    NSPredicate(value: false)
}

func makeUpcomingEventsFetchRequest() -> NSFetchRequest<Event>
{
    let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
    fetchRequest.predicate = makeUpcomingEventsPredicate()
    return fetchRequest
}
