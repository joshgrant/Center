//
//  SettingsDataStoreProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol SettingsDataStoreProtocol
{
    func getObjectForKey(_ key: String) -> Any
    func setObject(_ object: Any, forKey: String)
    
    func getBoolForKey(_ key: String) -> Bool
    func setBool(_ bool: Bool, forKey: String)
    
    func getDoubleForKey(_ key: String) -> Double
    func setDouble(_ double: Double, forKey: String)
    
    func getStringForKey(_ key: String) -> Double
    func setString(_ string: String, forKey: String)
}
