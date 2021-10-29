//
//  Note+CoreDataProperties.swift
//  kirakhmatullinPW4
//
//  Created by Karim on 28.10.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var descriptionText: String?
    @NSManaged public var relateToLastNote: Note?
    @NSManaged public var creationDate: Date
    @NSManaged public var status: Int32

}

extension Note : Identifiable {

}
