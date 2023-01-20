//
//  Room+CoreDataProperties.swift
//  Rooms
//
//  Created by Manoj kumar on 21/01/23.
//

import Foundation
import CoreData
import UIKit

extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }

    @NSManaged public var color: UIColor?
    @NSManaged public var length: Double
    @NSManaged public var name: String
    @NSManaged public var width: Double

}

extension Room : Identifiable {

}


