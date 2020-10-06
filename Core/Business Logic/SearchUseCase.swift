//
//  SearchUseCase.swift
//  Core
//
//  Created by Joshua Grant on 10/5/20.
//

import Foundation
import RealmSwift

class SearchUseCase: UseCase
{
    let query: SearchQuery
    let realm: Realm
    
    let completion: (() -> RSearchResult)?
    
    init(query: SearchQuery, realm: Realm)
    {
        self.query = query
        self.realm = realm
    }
    
    func start()
    {
        // Execute the query
        
        let queryString = query.queryString
        let results = realm
            .objects(RSymbol.self)
            .filter(RSymbol.predicate(for: queryString))
        
        completion?(
    }
    
    // TODO: Move to utility file
    func classNamesToClasses(_ classNames: [String]) -> [AnyClass]
    {
        classNames.compactMap {
            Bundle.main.classNamed($0)
        }
    }
}
