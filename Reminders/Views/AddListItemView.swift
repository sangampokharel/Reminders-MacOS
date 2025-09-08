//
//  AddListItemView.swift
//  Reminders
//
//  Created by sangam pokharel on 05/09/2025.
//

import SwiftUI
import CoreData

struct AddListItemView: View {
    @State private var text:String = ""
    @State private var selectedDate = Date.now
    @State private var showDatePicker = false
    @State private var isCompleted = false
    @Environment(\.managedObjectContext) private var viewContext
    let categoryEntity:CategoriesEntity?
    var onSave:((_ listItem:ListItem) -> () )?
    var body: some View {
        VStack {
            HStack {
                Image(systemName: isCompleted ? "circle.fill" : "circle")
                    .onTapGesture {
                        isCompleted.toggle()
                    }
                
                TextField("", text: $text)
            }
            
            Text("Notes")
                .opacity(0.3)
                .font(.headline)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack {
                
                Menu {
                    Button("Today"){
                        selectedDate = Date.now
                        print(selectedDate)
                    }
                    
                    Button("Custom") {
                        showDatePicker.toggle()
                    }
                } label: {
                    Text("Today")
                }.frame(width:100)
                    .menuStyle(.borderedButton)
                    .fixedSize()
                    .popover(isPresented: $showDatePicker) {
                        DatePicker("Select Date",selection: $selectedDate,displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .labelsHidden()
                            .onChange(of: selectedDate) { oldValue, newValue in
                                self.selectedDate = newValue
                            }
                    }
                
                
                Button("Save") {
                    let list = ListItemEntity(context: viewContext)
                    list.isCompleted = isCompleted
                    list.title = text
                    list.dueDate = selectedDate
                    list.list = categoryEntity!
                    
                    categoryEntity?.items?.adding(list)
                    do{
                        try viewContext.save()
                        text = ""
                        isCompleted = false
                    }catch {
                        print("Failed to save Item")
                    }
                    
                }.disabled(text.isEmpty)
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    AddListItemView(categoryEntity: nil)
}
