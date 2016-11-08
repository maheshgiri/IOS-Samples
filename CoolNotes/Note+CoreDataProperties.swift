//
//  Note+CoreDataProperties.swift
//  CoolNotes
//
//  Created by Hemisphere on 07/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import Foundation
import CoreData
 

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var createdDate: NSDate?
    @NSManaged public var text: String?
    @NSManaged public var notebook: NoteBook?

}
