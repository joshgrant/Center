//
//  LibraryViewModelProtocol.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import Foundation

protocol LibraryViewModelProtocol
{
    func getSystemsCount() -> Int
    func getStocksCount() -> Int
    func getFlowsCount() -> Int
    func getEventsCount() -> Int
    func getConversionsCount() -> Int
    func getDimensionsCount() -> Int
    func getSymbolsCount() -> Int
    func getNotesCount() -> Int
    func getProcessesCount() -> Int
}
