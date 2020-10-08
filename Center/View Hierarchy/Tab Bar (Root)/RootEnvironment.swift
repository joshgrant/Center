//
//  RootEnvironment.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation
import Schema

protocol RootEnvironmentProtocol
{
    var dataManager: Database { get set }
    
    init(dataManager: Database)
}

struct RootEnvironment: RootEnvironmentProtocol
{
    var dataManager: Database
    
    init(dataManager: Database)
    {
        self.dataManager = dataManager
    }
}
