//
//  Page.swift
//  Center
//
//  Created by Joshua Grant on 5/29/21.
//

import Foundation
import CoreData
import UIKit

protocol Pageable
{
    var title: String { get }
}

struct Page
{
    enum Modifier
    {
        case list
        case detail(entity: Entity)
        case info(entity: Entity)
        case filter
    }
    
    var kind: Pageable
    var modifier: Modifier?
    
    func makeHeaderViews() -> [UIView?]
    {
        let models = makeHeaderViewModels()
        return models.map {
            makeTableViewSectionHeader(model: $0)
        }
    }
    
    func makeHeaderViewModels() -> [TableViewHeaderModel]
    {
        switch (kind, modifier)
        {
        case (EntityType.system, .detail):
            return SectionHeader.systemDetail.map {
                makeHeaderViewModel(sectionHeader: $0)
            }
        case (EntityType.flow, .detail):
            return SectionHeader.flowDetail.map {
                makeHeaderViewModel(sectionHeader: $0)
            }
        case (TabType.dashboard, _):
            return SectionHeader.dashboard.map {
                makeHeaderViewModel(sectionHeader: $0)
            }
        default:
            return []
        }
    }
}
