//
//  TableViewSectionHeaderViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit
import Architecture
import Core

public struct TableViewSectionHeaderViewFactory
{
    public var sectionHeaderModel: TableViewHeaderModel
    
    public init(sectionHeaderModel: TableViewHeaderModel)
    {
        self.sectionHeaderModel = sectionHeaderModel
    }
    
    public func makeMainStackView() -> UIStackView
    {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.spacing = 5
        
        mainStackView.addArrangedSubview(Spacer(width: 5))

        if sectionHeaderModel.hasDisclosureTriangle
        {
            mainStackView.addArrangedSubview(makeDisclosureButton())
        }
        
        if let image = sectionHeaderModel.image
        {
            mainStackView.addArrangedSubview(makeImageView(image: image))
        }
        
        mainStackView.addArrangedSubview(makeTitleView())
        mainStackView.addArrangedSubview(Spacer())
        
        if sectionHeaderModel.hasSearchButton
        {
            mainStackView.addArrangedSubview(makeSearchButton())
        }
        
        if sectionHeaderModel.hasLinkButton
        {
            mainStackView.addArrangedSubview(makeLinkButton())
        }
        
        if sectionHeaderModel.hasAddButton
        {
            mainStackView.addArrangedSubview(makeAddButton())
        }
        
        if sectionHeaderModel.hasEditButton
        {
            mainStackView.addArrangedSubview(makeEditButton())
        }
        
        mainStackView.addArrangedSubview(Spacer(width: 5))
        
        return mainStackView
    }
    
    public func makeDisclosureButton() -> UIButton
    {
        let button = UIButton()
        button.setImage(UIImage(icon: .arrowDown), for: .normal)
        return button
    }
    
    public func makeImageView(image: UIImage) -> UIImageView
    {
        let imageView = UIImageView(image: image)
        imageView.tintColor = Color.tableViewHeaderIcon
        return imageView
    }
    
    public func makeTitleView() -> UILabel
    {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 13)
        label.textColor = Color.tableViewHeaderFont
        
        label.text = sectionHeaderModel.title
        label.text = sectionHeaderModel.title.localizedUppercase
        
        return label
    }
    
    public func makeSearchButton() -> UIButton
    {
        let button = UIButton()
        button.setImage(Icon.search.getImage(), for: .normal)
        return button
    }
    
    public func makeLinkButton() -> UIButton
    {
        let button = UIButton()
        button.setImage(Icon.link.getImage(), for: .normal)
        return button
    }
    
    public func makeAddButton() -> UIButton
    {
        let button = UIButton()
        button.setImage(Icon.add.getImage(), for: .normal)
        return button
    }
    
    func makeEditButton() -> UIButton
    {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        return button
    }
}
