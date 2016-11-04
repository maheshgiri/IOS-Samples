//
//  CustomTableViewCell.swift
//  TableListExample
//
//  Created by Hemisphere on 26/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var fullnameLable: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
     @IBOutlet weak var usernameLable: UILabel!
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
