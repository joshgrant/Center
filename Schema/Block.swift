////
////  Block.swift
////  Schema
////
////  Created by Joshua Grant on 10/6/20.
////
//
//import Foundation
//
//class Entity: Codable
//{
//    var id: UUID = .init()
//}
//
//class Block: Entity
//{
//    var url: URL?
//    var mainColor: Color?
//    var tintColor: Color?
//    var backgroundColor: Color?
//}
//
//class Color: Entity // Named
//{
//    var hue: Double = 0
//    var saturation: Double = 0
//    var brightness: Double = 0
//}
//
//class Condition: Entity
//{
//    var stock: Stock?
//    var predicate: Predicate = .equal
//    var target: Double = 0
//    var priority: Priority = .linear
//    var relationship: Relationship = .direct
//}
//
//class Contact: Entity // NoteStorage, Pinnable, Sharable
//{
//    var name: String?
//    var phone: String?
//    var email: String?
//}
//
//class Conversion: Entity
//{
//    var from: Unit?
//    var to: Unit?
//    var ratio: Ratio?
//    var isReversible: Bool = true
//}
//
//class Dimension: Entity // Named, UnitStorage
//{
//    
//}
//
//class Event: Entity // Named, Flow Storage, History Storage, Condition Storage, Note Storage, Pinnable
//{
//    var isActive: Bool = true
//}
//
//class Flow: Entity // Named, Event Storage, History Storage, Note Storage, Pinnable
//{
//    var contactDelegate: Contact?
//}
//
//class ProcessFlow: Flow // Required Stock Storage, Produced Stock Storage, Flow (Step) Storage
//{
//    var order: Order = .sequential
//    var completionType: CompletionType = .children
//    
//    var percentComplete: Double {
//        0
//    }
//}
//
//class History: Entity
//{
//    var amount: Double = 0
//    var date: Date = .init()
//    var event: HistoryEvent = .created
//}
//
//class Ideal: Entity
//{
//    var type: IdealType = .state
//    var state: State?
//}
//
//class ImageBlock: Block // Searchable
//{
//    var image: Data?
//    var caption: String?
//}
//
//class Net: Entity
//{
//    var timePeriod: TimePeriod = .day
//    var amount: Double = 0
//}
//
//class Note: Entity // Link Storage, Note Storage, Pinnable, Block Storage
//{
//    // MARK: - Caching
//    
//    var firstLine: String {
//        ""
//    }
//    
//    var secondLine: String {
//        ""
//    }
//    
//    var thumbnailImage: Data {
//        Data()
//    }
//}
//
//class TransferFlow: Flow
//{
//    var amount: Double = 0
//    var from: Stock?
//    var to: Stock?
//    var duration: TimeInterval = 0
//    var delay: TimeInterval = 0
//    var requiresUserCompletion: Bool = true
//}
//
//class Ratio: Entity
//{
//    var left: Double = 0
//    var right: Double = 0
//}
//
//class State: Entity
//{
//    var min: Double = 0
//    var max: Double = .greatestFiniteMagnitude
//}
//
//class Stock: Entity // Named, Event Storage, History Storage, Note Storage, Pinnable, Inflow Storage, Outflow Storage
//{
//    var amount: Double = 0
//    var amountType: AmountType = .Integer
//    var ideal: Ideal?
//    var dimension: Dimension?
//    var unit: Unit?
//    
//    func netAmount() -> Net?
//    {
//        nil
//    }
//}
//
//class Symbol: Entity // Link storage, Searchable
//{
//    var name: String?
//    
//    var links: [Entity] {
//        []
//    }
//}
//
//class System: Entity // Named, Note storage, stock storage, flow storage, event storage, pinnable
//{
//    var percentIdeal: Double {
//        0
//    }
//    
//    var suggestedFlows: [Flow] {
//        []
//    }
//}
//
//class TableBlock: Block // Searchable
//{
//    
//}
//
//class TextBlock: Block // Searchable
//{
//    var textSize: TextSize = .header
//    var textStyle: TextStyle = .normal
//    var content: String?
//}
//
//class Unit: Entity // Named, Note storage
//{
//    var isBaseUnit: Bool = true
//    var relativeTo: Unit?
//    var ratio: Ratio?
//}
