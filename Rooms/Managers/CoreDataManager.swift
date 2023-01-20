//
//  CoreDataManager.swift
//  Rooms
//
//  Created by Manoj kumar on 21/01/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        self.persistentContainer = NSPersistentContainer(name: "RoomModel")
        self.persistentContainer.loadPersistentStores { (description, error) in
            if let error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
    }
    
    func getAllRooms() -> [Room] {
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save data")
        }
    }
    
}
