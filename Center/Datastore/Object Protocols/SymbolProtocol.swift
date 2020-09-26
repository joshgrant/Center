//
//  SymbolProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol SymbolProtocol: Codable
{
    func getStringValue() -> String
    func setStringValue(_ stringValue: String)
}
