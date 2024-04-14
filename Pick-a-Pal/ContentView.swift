//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Robinson Thairu on 14/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var names: [String] = ["John", "Erin", "Andrea", "Carter", "Jasmine"]
    @State private var nameToAdd: String = ""
    @State private var pickedName = ""
    @State private var shouldRemovepickedName = false
    
    var body: some View {
        VStack {
            
            Text(pickedName.isEmpty ? "" : pickedName)
            
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Toggle("Remove Picked name", isOn: $shouldRemovepickedName)
            
            Button{
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovepickedName {
                        names.removeAll {
                            name in return (name == randomName)
                        }
                    }
                } else {
                    pickedName = ""
                }
            }label: {
                Text("Pick random name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
        
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .padding(.top, 16)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
