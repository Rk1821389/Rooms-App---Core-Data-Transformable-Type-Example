//
//  AddRoomViewModel.swift
//  Rooms
//
//  Created by Manoj kumar on 21/01/23.
//

import Foundation
import SwiftUI

class AddRoomViewModel: ObservableObject {
    
    let coreDM: CoreDataManager
    
    @Published var name: String = ""
    @Published var width: String = ""
    @Published var length: String = ""
    @Published var color: Color = Color.clear
    
    init() {
        coreDM = CoreDataManager.shared
    }
    
    func saveRoom() {
        let room = Room(context: coreDM.persistentContainer.viewContext)
        room.name = name
        room.width = Double(width) ?? 0.0
        room.length = Double(length) ?? 0.0
        room.color = UIColor(color)
        
        coreDM.save()
    }
    
}
