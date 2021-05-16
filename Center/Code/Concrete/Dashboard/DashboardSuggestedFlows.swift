//
//  DashboardSuggestedFlows.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import Foundation
import CoreData

func makeDashboardSuggestedFlowsPredicate() -> NSPredicate
{
    NSPredicate(format: "@suggestedIn.count > %@", 0)
}

func makeDashboardSuggestedFlowsFetchRequest() -> NSFetchRequest<Flow>
{
    let fetchRequest: NSFetchRequest<Flow> = Flow.fetchRequest()
    fetchRequest.predicate = makeDashboardSuggestedFlowsPredicate()
    fetchRequest.shouldRefreshRefetchedObjects = true
    return fetchRequest
}
