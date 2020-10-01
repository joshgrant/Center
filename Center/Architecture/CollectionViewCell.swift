//
//  CollectionViewCell.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

open class CollectionViewCell: UICollectionViewCell {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("Load this view programmatically")
    }
}
