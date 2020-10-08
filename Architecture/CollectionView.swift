//
//  CollectionView.swift
//  Architecture
//
//  Created by Joshua Grant on 9/25/20.
//

import UIKit

open class CollectionView: UICollectionView
{
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)
    {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder)
    {
        fatalError("Load this view programmatically")
    }
}
