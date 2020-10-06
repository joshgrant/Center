//
//  SchemaTests.swift
//  SchemaTests
//
//  Created by Joshua Grant on 10/6/20.
//

import XCTest
import CoreData
@testable import Schema

class SchemaTests: XCTestCase
{
    var schema: DataManager!
    
    override func setUpWithError() throws
    {
        schema = DataManager()
    }

    override func tearDownWithError() throws
    {
        try schema.erase()
    }

    func testExample() throws
    {
        let context = schema.context
//        let symbol = Symbol(context: context)
        
        
        symbol.name = "Hello"
        
        let fetchRequest: NSFetchRequest<Symbol> = Symbol.fetchRequest()
        // TODO: Get this predicate string from the symbol class?
        let queryString = "he"
        
        let predicate = Symbol.predicate(for: queryString)
        fetchRequest.predicate = predicate
        fetchRequest.includesSubentities = true // Interesting...
        fetchRequest.shouldRefreshRefetchedObjects = true
        
        let result = try schema.context.fetch(fetchRequest)
        
        print(result)
        
        XCTAssertEqual(result.first?.name, "Hello")
    }

    func testPerformanceExample() throws
    {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
