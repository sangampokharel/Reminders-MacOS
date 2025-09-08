//
//  AddListView.swift
//  Reminders
//
//  Created by sangam pokharel on 03/09/2025.
//

import SwiftUI

struct AddListView: View {
    
    @State private var text:String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var colors:[Color] = [.blue, .yellow, .green]
    @State private var selectedColor:Color = .blue
    
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        VStack(alignment:.leading) {
            
            Text("Add Category")
                .font(.title)
            
            TextField("Type Here...", text: $text)
                .textFieldStyle(.roundedBorder)
            HStack {
                ForEach(colors, id:\.self) { item in
                    Image(systemName: "button.programmable")
                        .foregroundStyle(item)
                        .onTapGesture {
                            selectedColor = item
                        }.scaleEffect(selectedColor == item ? 1.4 : 1)
                }
                Spacer()
            }.padding(.vertical)
            
            HStack {
                Spacer()
                
                Button("Cancel") {
                    dismiss()
                }
                
                Button("Add") {
                    let category = CategoriesEntity(context: viewContext)
                    category.category = text
                    category.colors = NSColor(selectedColor)
                    do{
                        try viewContext.save()
                        print("Saved successfully")
                        
                    }catch {
                        print("Failed to save")
                    }
                    dismiss()
                }.disabled(text.isEmpty)
            }
            
        }.padding(.vertical)
    }
}

#Preview {
    AddListView()
}
