//
//  Notes+CoreDataProperties.swift
//  SimpleCoreDataEx
//
//  Created by Hemisphere on 08/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes");
    }

    @NSManaged public var name: String?
    @NSManaged public var text: String?

}
