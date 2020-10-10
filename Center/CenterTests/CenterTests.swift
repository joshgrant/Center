//
//  CenterTests.swift
//  CenterTests
//
//  Created by Joshua Grant on 9/24/20.
//

import XCTest
@testable import Schema
@testable import Center

// TODO: Duplication with SchemaTests

class CenterTests: XCTestCase
{
    let schema = Database()
    
    override func setUpWithError() throws
    {
        schema.populate()
        
        print("Schema: \(schema)")
        print("Context: \(schema.context)")
        print("Container: \(schema.container)")
    }

    override func tearDownWithError() throws
    {
        try schema.erase()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testLibraryObjects() throws
    {
        let objects = try makeLibraryListCellModels(context: schema.context)
        
        XCTAssertEqual(objects.first?.count, 0)
        XCTAssertEqual(objects[3].count, 1)
    }
    
}
