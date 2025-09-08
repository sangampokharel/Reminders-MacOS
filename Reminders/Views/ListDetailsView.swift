//
//  ListDetailsView.swift
//  Reminders
//
//  Created by sangam pokharel on 04/09/2025.
//

import SwiftUI

struct ListItem:Identifiable {
    let id = UUID().uuidString
    var dueDate:Date = Date.now
    var isCompleted = false
    let title:String
}

struct ListDetailsView: View {
    @ObservedObject var categoryEntity: CategoriesEntity
    @FetchRequest(entity: ListItemEntity.entity(), sortDescriptors: [], animation: .default) var items: FetchedResults<ListItemEntity>
    @State private var isActive = false
    @Environment(\.managedObjectContext) private var viewContext
    
    private var filteredItems: [ListItemEntity] {
        return items.filter { $0.list == categoryEntity }
    }
    
    var body: some View {
        VStack {
            if !categoryEntity.isDeleted && categoryEntity.managedObjectContext != nil {
                ListDetailTopView(categories: categoryEntity, itemCount: filteredItems.count)
                
                if filteredItems.isEmpty {
                    Spacer()
                    ContentUnavailableView("No Items Found!", systemImage: "tray.circle")
                    Spacer()
                }else{
                    List {
                        ForEach(filteredItems, id: \.objectID) { item in
                            HStack {
                                HStack {
                                    Image(systemName: item.isCompleted ? "circle.fill":"circle")
                                        .onTapGesture {
                                            item.isCompleted.toggle()
                                            try? viewContext.save()
                                        }
                                    VStack(alignment: .leading) {
                                        Text(item.title ?? "")
                                        if let date = item.dueDate {
                                            Text("\(date)")
                                                .foregroundStyle(Color.secondary)
                                        }
                                    }
                                }
                                Spacer()
                                if isActive {
                                    Button {
                                        viewContext.delete(item)
                                        try? viewContext.save()
                                    } label: {
                                        Image(systemName: "trash.circle")
                                            .foregroundStyle(.red)
                                    }
                                    
                                    Button {} label: {
                                        Image(systemName: "info.circle.fill")
                                            .foregroundStyle(.blue)
                                    }
                                }
                                
                            }.onHover { value in
                                self.isActive = value
                            }
                        }
                    }
                }
                AddListItemView(categoryEntity: categoryEntity)
                    .background(Color(NSColor.darkGray))
            } else {
                // Show empty state when category is deleted or invalid
                Spacer()
                ContentUnavailableView("Category Deleted", systemImage: "trash")
                Spacer()
            }
            
        }
    }
}

//#Preview {
//    ListDetailsView(categoryEntity: nil )
//}

struct ListDetailTopView: View {
    let categories:CategoriesEntity
    let itemCount: Int
    
    var body: some View {
        HStack {
            Text(categories.category ?? "")
            Spacer()
            Text("\(itemCount)")
        }.foregroundStyle(Color(categories.colors ?? .clear))
            .font(.title)
            .padding()
            .background(Color(NSColor.darkGray))
    }
}
