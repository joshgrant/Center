//
//  Icon.swift
//  Center
//
//  Created by Joshua Grant on 9/26/20.
//

import UIKit

public enum Icon: String
{
    case add = "plus"
    case pin = "pin"
    case pinFill = "pin.fill"
    case flow = "wind"
    case forecast = "calendar"
    case system = "network"
    case stock = "shippingbox"
    case event = "sparkles"
    case conversion = "arrow.left.arrow.right"
    case rightArrow = "arrow.right"
    case leftArrow = "arrow.left"
    case condition = "switch.2"
    case dimension = "move.3d"
    case symbol = "asterisk.circle"
    case note = "note.text"
    case process = "flowchart"
    case search = "magnifyingglass"
    case dashboard = "speedometer"
    case library = "books.vertical"
    case inbox = "tray.and.arrow.down"
    case settings = "gearshape"
    case copy = "doc.on.doc"
    case activateFlow = "play.circle"
    case link = "link"
    case filter = "line.horizontal.3.decrease.circle"
    case checkBoxEmpty = "circle"
    case checkBoxFilled = "checkmark.circle"
    case priority = "exclamationmark.triangle.fill" // or remove the fill
    
    case arrowDown = "arrowtriangle.down.fill"
    case arrowRight = "arrowtriangle.right.fill"
    
    public func getImage() -> UIImage?
    {
        return UIImage(systemName: self.rawValue)
    }
}
