//
//  DatabaseModel.swift
//  Core
//
//  Created by Joshua Grant on 10/1/20.
//

import Foundation

protocol DatabaseModel: Codable
{
    var objects: [ObjectModel] { get set }
}
