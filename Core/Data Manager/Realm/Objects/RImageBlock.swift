//
//  RImageBlock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RImageBlock: Object, ImageBlock
{
    @objc dynamic public var id: UUID = .init()
    @objc dynamic public var image: Data?
    @objc dynamic public var caption: String?
    @objc dynamic public var url: URL?
    @objc dynamic public var mainColor: Color?
    @objc dynamic public var tintColor: Color?
    @objc dynamic public var backgroundColor: Color?
}
