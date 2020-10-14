//
//  TableViewHeader.swift
//  Center
//
//  Created by Joshua Grant on 10/13/20.
//

import Foundation
import UIKit

public func makeMainStackView(headerModel: TableViewHeaderModel) -> UIStackView
{
    let mainStackView = UIStackView()
    mainStackView.axis = .horizontal
    mainStackView.alignment = .center
    mainStackView.spacing = 5
    
    mainStackView.addArrangedSubview(Spacer(width: 5))
    
    if headerModel.hasDisclosureTriangle
    {
        mainStackView.addArrangedSubview(makeDisclosureButton())
    }
    
    if let image = headerModel.image
    {
        mainStackView.addArrangedSubview(makeImageView(image: image))
    }
    
    mainStackView.addArrangedSubview(makeTitleView(headerModel: headerModel))
    mainStackView.addArrangedSubview(Spacer())
    
    if headerModel.hasSearchButton
    {
        mainStackView.addArrangedSubview(makeSearchButton())
    }
    
    if headerModel.hasLinkButton
    {
        mainStackView.addArrangedSubview(makeLinkButton())
    }
    
    if headerModel.hasAddButton
    {
        mainStackView.addArrangedSubview(makeAddButton())
    }
    
    if headerModel.hasEditButton
    {
        mainStackView.addArrangedSubview(makeEditButton())
    }
    
    mainStackView.addArrangedSubview(Spacer(width: 5))
    
    return mainStackView
}

public func makeDisclosureButton() -> UIButton
{
    let button = UIButton()
    button.setImage(UIImage(named: "disclosure.right"), for: .normal)
    button.tintColor = .tableViewHeaderIcon
    set(width: 44, height: 44, on: button)
    return button
}

public func makeImageView(image: UIImage) -> UIImageView
{
    let imageView = UIImageView(image: image)
    imageView.tintColor = UIColor.tableViewHeaderIcon
    return imageView
}

public func makeTitleView(headerModel: TableViewHeaderModel) -> UILabel
{
    let label = UILabel()
    
    label.font = .systemFont(ofSize: 13)
    label.textColor = UIColor.tableViewHeaderFont
    
    label.text = headerModel.title
    label.text = headerModel.title.localizedUppercase
    
    return label
}

public func makeSearchButton() -> UIButton
{
    let button = UIButton()
    button.setImage(Icon.search.getImage(), for: .normal)
    button.tintColor = .tableViewHeaderIcon
    set(width: 44, height: 44, on: button)
    return button
}

public func makeLinkButton() -> UIButton
{
    let button = UIButton()
    button.setImage(Icon.link.getImage(), for: .normal)
    button.tintColor = .tableViewHeaderIcon
    set(width: 44, height: 44, on: button)
    return button
}

public func makeAddButton() -> UIButton
{
    let button = UIButton()
    button.setImage(Icon.add.getImage(), for: .normal)
    button.tintColor = .tableViewHeaderIcon
    set(width: 44, height: 44, on: button)
    return button
}

func makeEditButton() -> UIButton
{
    let button = UIButton()
    button.setTitle("Edit", for: .normal)
    button.setTitleColor(.tableViewHeaderFont, for: .normal)
    set(width: 44, height: 44, on: button)
    return button
}

// TODO: Gross, I don't like side effects
func set(width: CGFloat? = nil, height: CGFloat? = nil, on view: UIView)
{
    if let width = width {
        setAttribute(attribute: .width, value: width, on: view)
    }
    
    if let height = height {
        setAttribute(attribute: .height, value: height, on: view)
    }
}

func setAttribute(attribute: NSLayoutConstraint.Attribute, value: CGFloat, on view: UIView)
{
    NSLayoutConstraint.activate([
        NSLayoutConstraint(
            item: view,
            attribute: attribute,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: value)
    ])
}
