//
//  RTextBlock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RTextBlock: RBlock
{
    @objc dynamic public var textSize: TextSize = .body
    @objc dynamic public var textStyle: TextStyle = .normal
}
