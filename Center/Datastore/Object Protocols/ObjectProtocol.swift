//
//  ObjectProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol ObjectProtocol: Codable
{
    func getSymbol() -> SymbolProtocol
    func setSymbol(_ symbol: SymbolProtocol)
    
    func getNotes() -> [NoteProtocol]
    func linkNote(_ note: NoteProtocol)
    
    // MARK: - Caching
    
    func getNotesCount() -> Int
}
