//
//  TableViewSectionHeaderViewFactory.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit
import Architecture

protocol TableViewSectionHeaderViewFactoryProtocol
{
    var sectionHeaderModel: TableViewHeaderModel { get }
    
    init(sectionHeaderModel: TableViewHeaderModel)
    
    func makeDisclosureButton() -> SectionHeaderDisclosureButton
    func makeImageView() -> UIImageView
    func makeTitleView() -> UILabel
    func makeSearchButton() -> UIButton
    func makeLinkButton() -> UIButton
    func makeAddButton() -> UIButton
}

public struct TableViewSectionHeaderViewFactory: TableViewSectionHeaderViewFactoryProtocol
{
    var sectionHeaderModel: TableViewHeaderModel
    
    init(sectionHeaderModel: TableViewHeaderModel)
    {
        self.sectionHeaderModel = sectionHeaderModel
    }
    
    func makeDisclosureButton() -> SectionHeaderDisclosureButton
    {
        let button = SectionHeaderDisclosureButton()
        button.backgroundColor = .brown
        return button
    }
    
    func makeImageView() -> UIImageView
    {
        let image = Icon.flow.getImage()
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func makeTitleView() -> UILabel
    {
        let label = UILabel()
        label.text = sectionHeaderModel.title
        return label
    }
    
    func makeSearchButton() -> UIButton
    {
        let button = UIButton()
        button.setImage(Icon.search.getImage(), for: .normal)
        return button
    }
    
    func makeLinkButton() -> UIButton
    {
        let button = UIButton()
        button.setImage(Icon.link.getImage(), for: .normal)
        return button
    }
    
    func makeAddButton() -> UIButton
    {
        let button = UIButton()
        button.setImage(Icon.add.getImage(), for: .normal)
        return button
    }
}
