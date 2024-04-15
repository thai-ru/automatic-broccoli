//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Robinson Thairu on 14/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var pals: [Pal] = []
    @Environment(\.modelContext) private var context
    
    @State private var addFirstName = ""
    @State private var addLastName = ""
    
    @State private var pickedName = ""
    @State private var shouldRemovepickedName = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text(pickedName.isEmpty ? "" : pickedName)
                
                List (pals, id: \.firstName){ pals in
                    HStack {
                        Text(pals.firstName)
                        
                        Spacer()
                        
                        Text( pals.lastName)
                    }
                }
                
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
                Text("Add Name")
                    .foregroundStyle(.red)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .fontDesign(.serif)
                    .padding(.top, 8)
                
            HStack {
                TextField("First Name", text: $addFirstName)
                    .autocorrectionDisabled()
                
                Spacer()
                
                TextField("Last Name", text: $addLastName)
                    .autocorrectionDisabled()
                
            }
            .padding()
            .textFieldStyle(.roundedBorder)
                
            Button("Submit") {
                let newPal = Pal(firstName: addFirstName, lastName: addLastName)
                
                if (!addFirstName.isEmpty && !addLastName.isEmpty) {
                    context.insert(newPal)
                }
                
                addLastName = ""
                addFirstName = ""
                
            }
            .labelStyle(.iconOnly)
            .bold()
            .buttonStyle(.bordered)
            .padding(.top, 12)
                
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Pal.self, inMemory: true)
}
