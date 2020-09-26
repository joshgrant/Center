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
    
    func getDirectReferences() -> [Any]
    
    func getLinks() -> [Any]
    func addLink(_ link: Any)
    
    func getNotes() -> [NoteProtocol]
    func linkNote(_ note: NoteProtocol)
    
    // MARK: - Caching
    
    func getLinksCount() -> Int
    func getNotesCount() -> Int
}
