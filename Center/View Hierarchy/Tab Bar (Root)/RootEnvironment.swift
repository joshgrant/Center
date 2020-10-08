//
//  RootEnvironment.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import Schema

struct RootEnvironment
{
    var database: Database
    
    init(database: Database)
    {
        self.database = database
    }
}
