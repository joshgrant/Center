//
//  ObjectProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol ObjectProtocol: Codable
{
    
    // TODO: Refactor this to use "Symbol" instead of string
    func getSymbol() -> SymbolProtocol
    func setSymbol(_ symbol: SymbolProtocol)
    
    func getNoteOverviews() -> [NoteOverviewProtocol]
    func linkNote(_ note: NoteProtocol)
}
