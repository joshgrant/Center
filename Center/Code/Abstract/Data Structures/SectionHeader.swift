//
//  SectionHeader.swift
//  Center
//
//  Created by Joshua Grant on 5/29/21.
//

import UIKit

struct TableViewHeaderModel
{
    var title: String
    var icon: Icon?
    
    var disclosureTriangleActionClosure: ActionClosure?
    var searchButtonActionClosure: ActionClosure?
    var linkButtonActionClosure: ActionClosure?
    var addButtonActionClosure: ActionClosure?
    var editButtonActionClosure: ActionClosure?
    
    var hasDisclosureTriangle: Bool { disclosureTriangleActionClosure != nil }
    var hasSearchButton: Bool { searchButtonActionClosure != nil }
    var hasLinkButton: Bool { linkButtonActionClosure != nil }
    var hasAddButton: Bool { addButtonActionClosure != nil }
    var hasEditButton: Bool { editButtonActionClosure != nil }
    
    init(title: String)
    {
        self.title = title
    }
    
    init(title: String, icon: Icon)
    {
        self.title = title
        self.icon = icon
    }
    
    private func makeTitleView() -> UILabel
    {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIColor.tableViewHeaderFont
        
        label.text = title
        label.text = title.localizedUppercase
        
        return label
    }
    
    private func makeMainStackView() -> UIStackView
    {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.spacing = 5
        
        mainStackView.addArrangedSubview(Spacer(width: 5))
        
        if hasDisclosureTriangle
        {
            mainStackView.addArrangedSubview(makeDisclosureButton())
        }
        
        if let image = icon?.getImage()
        {
            mainStackView.addArrangedSubview(makeImageView(image: image))
        }
        
        mainStackView.addArrangedSubview(makeTitleView())
        mainStackView.addArrangedSubview(Spacer())
        
        if hasSearchButton
        {
            mainStackView.addArrangedSubview(makeSearchButton())
        }
        
        if hasLinkButton
        {
            mainStackView.addArrangedSubview(makeLinkButton())
        }
        
        if hasAddButton
        {
            mainStackView.addArrangedSubview(makeAddButton())
        }
        
        if hasEditButton
        {
            mainStackView.addArrangedSubview(makeEditButton())
        }
        
        mainStackView.addArrangedSubview(Spacer(width: 5))
        
        return mainStackView
    }
    
    func makeTableViewSectionHeader() -> View
    {
        let view = View(
            frame: .init(origin: .zero,
                         size: .init(width: 30, height: 30)))
        view.backgroundColor = .systemGroupedBackground
        
        let stackView = makeMainStackView()
        view.embed(stackView)
        
        return view
    }
}

//enum SectionHeader: Int
//{
//    case info
//    case suggestedFlows
//    case stocks
//    case flows
//    case events
//    case notes
//    case history
//    case pinned
//    case forecast
//    case priority
//    case states
//    case inflows
//    case outflows
//
//    static var systemDetail: [SectionHeader]
//    {
//        [
//            .info, .stocks, .flows, .events, .notes
//        ]
//    }
//
//    static var flowDetail: [SectionHeader]
//    {
//        [
//            .info, .events, .history, .notes
//        ]
//    }
//
//    static var dashboard: [SectionHeader]
//    {
//        [
//            .pinned, .flows, .forecast, .priority
//        ]
//    }
//
//    static var stockDetail: [SectionHeader]
//    {
//        [
//            .info, .states, .inflows, .outflows, .events, .notes
//        ]
//    }
//
//    var title: String
//    {
//        switch self
//        {
//        case .info: return "Info"
//        case .suggestedFlows: return "Suggested Flows"
//        case .stocks: return "Stocks"
//        case .flows: return "Flows"
//        case .events: return "Events"
//        case .notes: return "Notes"
//        case .history: return "History"
//        case .pinned: return "Pinned"
//        case .forecast: return "Forecast"
//        case .priority: return "Priority"
//        case .states: return "States"
//        case .inflows: return "Inflows"
//        case .outflows: return "Outflows"
//        }
//    }
//
//    var icon: Icon?
//    {
//        switch self
//        {
//        case .info, .suggestedFlows: return nil
//        case .stocks: return .stock
//        case .flows: return .flow
//        case .events: return .event
//        case .notes: return .note
//        case .pinned: return .pinFill
//        case .forecast: return .forecast
//        case .priority: return .priority
//        case .history: return nil
//        case .states: return .state
//        case .inflows: return nil
//        case .outflows: return nil
//        }
//    }
//
//    var hasDisclosureTriangle: Bool
//    {
//        switch self
//        {
//        case .events, .notes, .states, .stocks, .flows:
//            return true
//        default:
//            return false
//        }
//    }
//
//    var hasSearchButton: Bool
//    {
//        switch self
//        {
//        case .events:
//            return true
//        default:
//            return false
//        }
//    }
//
//    var hasLinkButton: Bool
//    {
//        switch self
//        {
//        case .notes, .events:
//            return true
//        default:
//            return false
//        }
//    }
//
//    var hasAddButton: Bool
//    {
//        switch self
//        {
//        case .stocks, .events, .notes, .flows:
//            return true
//        default:
//            return false
//        }
//    }
//
//    var hasEditButton: Bool
//    {
//        switch self
//        {
//        case .states:
//            return true
//        default:
//            return false
//        }
//    }
//}
