//
//  TableViewSectionHeaderView.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

class TableViewSectionHeaderView: View
{
    var viewFactory: TableViewSectionHeaderViewFactoryProtocol
    
    init(viewFactory: TableViewSectionHeaderViewFactoryProtocol)
    {
        self.viewFactory = viewFactory
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        configureBackgroundView()
        
        let mainStackView = viewFactory.makeMainStackView()
        self.embed(mainStackView)
    }
    
    func configureBackgroundView()
    {
        backgroundColor = .systemGroupedBackground
    }
}
