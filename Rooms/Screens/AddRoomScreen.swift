//
//  ContentView.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import SwiftUI

struct AddRoomScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var addRoomVM = AddRoomViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Enter room", text: $addRoomVM.name)
                    TextField("Enter width", text: $addRoomVM.width)
                    TextField("Enter length", text: $addRoomVM.length)
                    ColorPicker("Select color", selection: $addRoomVM.color)
                    
                    HStack {
                        Spacer()
                        Button("Save") {
                            addRoomVM.saveRoom()
                            dismiss()
                        }
                        Spacer()
                    }

                }
            }
            .navigationTitle("Add Room")
        }
    }
}

struct AddRoomScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddRoomScreen()
    }
}
