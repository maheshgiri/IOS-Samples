//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Hemisphere on 08/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        self.created=NSDate()
    }
    
}
