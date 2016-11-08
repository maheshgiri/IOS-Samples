//
//  NoteBook+CoreDataClass.swift
//  CoolNotes
//
//  Created by Hemisphere on 07/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import Foundation
import CoreData


public class NoteBook: NSManagedObject {
    convenience init(text:String="New Note",context:NSManagedObjectContext) {
        if let ent=NSEntityDescription.entity(forEntityName: "NoteBook", in: context){
            self.init(entity: ent, insertInto: context)
            self.name = text
            self.createdDate = NSDate()
        }
        else{
            fatalError("Unable to find Enitities...")
        }
    }
    var humanReadbleDate:String{
        get{
            let df=DateFormatter()
            df.timeStyle = .none
            df.dateStyle = .short
            df.doesRelativeDateFormatting=true
            df.locale=NSLocale.current
            return df.string(from: createdDate! as Date)
        }
    }

}
