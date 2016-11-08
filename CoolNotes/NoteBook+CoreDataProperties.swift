//
//  NoteBook+CoreDataProperties.swift
//  CoolNotes
//
//  Created by Hemisphere on 07/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import Foundation
import CoreData
 

extension NoteBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteBook> {
        return NSFetchRequest<NoteBook>(entityName: "NoteBook");
    }

    @NSManaged public var createdDate: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var notes: NSSet?

}

// MARK: Generated accessors for notes
extension NoteBook {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}
