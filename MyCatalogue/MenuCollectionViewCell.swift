//
//  MenuCollectionViewCell.swift
//  MyCatalogue
//
//  Created by anoopm on 18/01/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuLabel:UILabel!
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 8.0
    }
}
