//
//  TableViewSectionHeaderView.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit
import Architecture

class TableViewSectionHeaderView: View
{
    var viewFactory: TableViewSectionHeaderViewFactoryProtocol
    
    init(viewFactory: TableViewSectionHeaderViewFactoryProtocol)
    {
        self.viewFactory = viewFactory
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        configureBackgroundView()
        
        // TODO: Add a function to pin the stack view...
        let mainStackView = viewFactory.makeMainStackView()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mainStackView)
        
        let topConstraint = mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3)
        topConstraint.priority = .init(1)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            topConstraint,
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func configureBackgroundView()
    {
//        backgroundColor = .systemGroupedBackground
        backgroundColor = .darkGray
    }
}
