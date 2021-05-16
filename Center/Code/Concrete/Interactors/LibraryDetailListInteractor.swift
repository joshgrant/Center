//
//  LibraryDetailListInteractor.swift
//  Center
//
//  Created by Joshua Grant on 10/8/20.
//

import Foundation

// TODO: Extend the "back button" interactor
// TODO: Extend the "add" interactor
// TODO: Extend the "search" interactor

protocol LibraryDetailListInteractor
{
    associatedtype T: Entity
    
    func search(text: String)
    func goBack()
    func add()
    func select(entity: T)
}
