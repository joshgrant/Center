//
//  Note.swift
//  Core
//
//  Created by Joshua Grant on 10/2/20.
//

import Foundation
import RealmSwift

@objc protocol Note: Entity
{
    /// The concrete instance of symbol should define a `List<Block>` property
    func blocks() -> [Block]
    func add(block: Block)
    func delete(block: Block)
    
    /// The concrete instance of symbol should define a `List<Entity>` property
    func links() -> [Entity]
    func link(entity: Entity)
    func unlink(entity: Entity)
    
    func relatedNotes() -> [Note]
    
    // MARK: - Caching
    
    func getFirstLink() -> String?
    func getSecondLine() -> String?
    func getThumbnailImage() -> Any?
    
    func linksCount() -> Int
    func relatedNotesCount() -> Int
}

@objc protocol Color
{
    var hue: Double { get set }
    var saturation: Double { get set }
    var brightness: Double { get set }
}

@objc protocol Block
{
    var url: URL { get set }
    var mainColor: Color { get set }
    var tintColor: Color { get set }
    var backgroundColor: Color { get set }
    
    func relatedNotes() -> [Note]
}

@objc protocol TextBlock: Block
{
    var textSize: TextSize { get set }
    var textStyle: TextStyle { get set }
}

@objc enum TextSize: Int, RealmEnum
{
    case header
    case sectionTitle
    case body
    case caption
}

@objc enum TextStyle: Int, RealmEnum
{
    case bold
    case italic
    case boldItalic
    case normal
}

@objc protocol ImageBlock: Block
{
    var image: Data { get set }
    var caption: String { get set }
}

@objc protocol TableBlock: Block
{
    // TODO: Column objects, row objects, cell objects, with values
    // Column styling, row styling, etc
}
