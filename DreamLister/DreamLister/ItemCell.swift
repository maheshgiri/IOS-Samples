//
//  ItemCell.swift
//  DreamLister
//
//  Created by Hemisphere on 09/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var details: UILabel!

    func configureCell(item:Item) {
        title.text=item.title
        price.text="$\(item.price)"
        details.text=item.details
    }
    

}
