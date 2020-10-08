//
//  DatabaseTests.swift
//  Schema
//
//  Created by Joshua Grant on 10/6/20.
//

import XCTest
import CoreData

@testable import Schema

class DatabaseTests: XCTestCase
{
    let schema = Database()
    
    override func setUpWithError() throws
    {
    }
    
    override func tearDownWithError() throws
    {
        try schema.erase()
    }
    
    func testPopulate()
    {
        schema.populate()
    }
    
    func testErase()
    {
        
    }
}
