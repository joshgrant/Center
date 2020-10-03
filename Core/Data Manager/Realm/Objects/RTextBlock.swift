//
//  RTextBlock.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

open class RTextBlock: Object, TextBlock
{
    @objc dynamic public var textSize: TextSize = .body
    @objc dynamic public var textStyle: TextStyle = .normal
    @objc dynamic public var url: URL?
    @objc dynamic public var mainColor: Color?
    @objc dynamic public var tintColor: Color?
    @objc dynamic public var backgroundColor: Color?
    
    private let _relatedNotes = List<RNote>()
    
    public func relatedNotes() -> [Note] {
        _relatedNotes.map { $0 as Note }
    }
}
