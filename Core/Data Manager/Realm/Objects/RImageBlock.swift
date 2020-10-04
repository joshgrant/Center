//
//  RImageBlock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RImageBlock: RBlock
{
    @objc dynamic public var image: Data?
    @objc dynamic public var caption: String?
}
