//
//  SpacerView.swift
//  Center
//
//  Created by Joshua Grant on 9/28/20.
//

import UIKit
import Architecture

class Spacer: View
{
    // MARK: - Initialization
    
    init(width: CGFloat? = nil, height: CGFloat? = nil)
    {
        super.init(frame: .init(
                    x: 0,
                    y: 0,
                    width: width ?? 0,
                    height: height ?? 0))
        
        // Width
        
        if let width = width
        {
            setWidth(width)
        }
        else
        {
            setLowCompressionResistanceForAxis(.horizontal)
        }
        
        // Height
        
        if let height = height
        {
            setHeight(height)
        } else {
            setLowCompressionResistanceForAxis(.vertical)
        }
    }
    
    func setWidth(_ width: CGFloat)
    {
        let widthConstraint = widthAnchor.constraint(equalToConstant: width)
        NSLayoutConstraint.activate([widthConstraint])
    }
    
    func setHeight(_ height: CGFloat)
    {
        let heightConstraint = heightAnchor.constraint(equalToConstant: height)
        NSLayoutConstraint.activate([heightConstraint])
    }
    
    func setLowCompressionResistanceForAxis(_ axis: NSLayoutConstraint.Axis)
    {
        setContentCompressionResistancePriority(.defaultLow, for: axis)
    }
}
