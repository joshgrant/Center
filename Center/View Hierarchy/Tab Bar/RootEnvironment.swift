//
//  RootEnvironment.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol RootEnvironmentProtocol
{
    var dataManager: DataManagerProtocol { get set }
    
    init(dataManager: DataManagerProtocol)
}

struct RootEnvironment: RootEnvironmentProtocol
{
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol)
    {
        self.dataManager = dataManager
    }
}
