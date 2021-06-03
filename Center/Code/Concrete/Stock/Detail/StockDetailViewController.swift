//
//  StockDetailViewController.swift
//  Center
//
//  Created by Joshua Grant on 6/3/21.
//

import UIKit

class StockDetailViewController: ViewController
{
    var model: StockDetailViewModel?
}

class StockDetailView: View
{
    var pinBarButtonItem: UIBarButtonItem?
    var duplicateBarButtonItem: UIBarButtonItem?
    
    var tableView: TableView?
    
    var titleCell: TitleEditCell?
    
    override init(frame: CGRect = .zero)
    {
        super.init(frame: frame)
    }
}

/// The view state is something that isn't stored as part of the database? It's just
///
struct StockDetailViewModel
{
    var pinned: Bool
    
    var editingTitle: Bool
    var presentingIdealInfoPanel: Bool
    
    var eventsExpanded: Bool
    var notesExpanded: Bool
    var statesExpanded: Bool
    
    var stock: Stock
    
    var title: String { stock.title }
    
    var typeDetail: String { stock.typeDescription }
    
    var dimensionDetail: String { stock.dimensionDescription }
    
    var currentDetail: String { stock.currentDescription }
    
    var netDetail: String { stock.netDescription }
    
    var states: [State]? { stock.validStates?.toArray() }
    
    var inflows: [TransferFlow]? { stock.inflows?.toArray() }
    
    var outflows: [TransferFlow]? {
        stock.outflows?.toArray() }
    
    var events: [Event]? {
        stock.events?.toArray() }
    
    var notes: [Note]? {
        stock.notes?.toArray() }
    
    // Cell Models
    
    var infoHeader: TableViewHeaderModel = {
        TableViewHeaderModel(title: "Info")
    }()
    
    var titleCellModel: TitleEditCellModel
    var typeCellModel: DetailCellModel
    var dimensionCellModel: DetailCellModel
    var currentCellModel: DetailCellModel // TODO: Sub-title detail cell
    var netCellModel: DetailCellModel
    
    var statesHeader: TableViewHeaderModel = {
        var model = TableViewHeaderModel(title: "States", icon: .state)
        
        model.disclosureTriangleActionClosure = ActionClosure { selector in
            print("Tapped states disclosure button")
        }
        
        model.editButtonActionClosure = ActionClosure { selector in
            print("Tapped state edit button")
        }
        
        return model
    }()
    
    var inflowsHeader: TableViewHeaderModel = {
        return TableViewHeaderModel(title: "Inflows")
    }()
    
    var outflowsHeader: TableViewHeaderModel = {
        return TableViewHeaderModel(title: "Outflows")
    }()
    
    var eventsHeader: TableViewHeaderModel = {
        var model = TableViewHeaderModel(title: "Events", icon: .event)
        
        model.disclosureTriangleActionClosure = ActionClosure { selector in
            print("Tapped events disclosure button")
        }
        
        model.linkButtonActionClosure = ActionClosure { selector in
            print("Tapped events search button")
        }
        
        model.addButtonActionClosure = ActionClosure { selector in
            print("Tapped events add button")
        }
        
        return model
    }()
    
    var notesHeader: TableViewHeaderModel = {
        var model = TableViewHeaderModel(
            title: "Notes",
            icon: .note)
        
        model.linkButtonActionClosure = ActionClosure { selector in
            print("Tapped link notes add button")
        }
        
        model.addButtonActionClosure = ActionClosure { selector in
            print("Tapped notes add button")
        }
        
        return model
    }()
    
    lazy var headers: [TableViewHeaderModel] = [
        infoHeader,
        statesHeader,
        inflowsHeader,
        outflowsHeader,
        eventsHeader,
        notesHeader
    ]
}

// An action modifies the state of the view controller
enum StockDetailViewAction
{
    // When in the detail
    case back
    case pin
    case unpin
    case duplicate
    
    // When adding modally
    case cancel
    case done
    
    case beginEditingTitle
    case endEditingTitle
    
    case checkStateMachine
    case uncheckStateMachine
    
    case openTypeDetail
    case openDimensionDetail
    case openCurrentDetail
    case openNetInfoPanel
    
    case select(state: State)
    case expandStateList
    case collapseStateList
    case editStateList
    
    case select(inflow: TransferFlow)
    case select(outflow: TransferFlow)
    
    case expandEventList
    case collapseEventList
    case openLinkEvent
    case addEvent
    case unlink(event: Event)
    case select(event: Event)
    
    case expandNoteList
    case collapseNoteList
    case openLinkNote
    case addNote
    case unlink(note: Note)
    case select(note: Note)
}
