//
//  SideBarView.swift
//  Reminders
//
//  Created by sangam pokharel on 03/09/2025.
//

import SwiftUI

struct SideBarView:View {
    @Binding var showAddListView:Bool
    @FetchRequest(entity: CategoriesEntity.entity(), sortDescriptors: [],predicate: nil,animation: .default) var categories: FetchedResults<CategoriesEntity>
    @Environment(\.managedObjectContext) var viewContext
    var body: some View {
        Group {
            SideBarTopView(count:categories.count)
            if categories.isEmpty {
                Spacer()
                ContentUnavailableView("No Categories Found!", systemImage: "tray.circle")
                Spacer()
            }else{
                List(categories,id:\.self) { item in
                    NavigationLink {
                        ListDetailsView(categoryEntity: item)
                    } label: {
                        ListRowView(item: item)
                    }.contextMenu {
                        Button {
                            viewContext.delete(item)
                            try? viewContext.save()
                        } label: {
                            Label("Delete", image: "trash")
                        }
                    }}
            }
            Spacer()
            
            HStack {
                Label {
                    Text("Add List")
                        .font(.subheadline)
                } icon: {
                    Image(systemName: "plus.app")
                }.onTapGesture {
                    showAddListView = true
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    SideBarView(showAddListView: .constant(false))
}

struct SideBarTopView: View {
    let count:Int
    var body: some View {
        GroupBox{
            HStack {
                VStack(spacing:4) {
                    Image(systemName: "note.text")
                    Text("All")
                        .font(.subheadline.bold())
                    
                }
                Spacer()
                Text("\(count)")
                    .font(.title)
            }
            .padding(.horizontal,4)
            .frame(height:50)
        }
    }
}

struct ListRowView: View {
    let item:CategoriesEntity
    
    var body: some View {
        ListRowContent(item: item)
    }
}

struct ListRowContent: View {
    let item: CategoriesEntity
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest private var items: FetchedResults<ListItemEntity>
    
    init(item: CategoriesEntity) {
        self.item = item
        self._items = FetchRequest<ListItemEntity>(
            entity: ListItemEntity.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "list == %@", item),
            animation: .default
        )
    }
    
    var body: some View {
        HStack {
            Label {
                Text(item.category ?? "")
            } icon: {
                Image(systemName: "list.bullet.circle.fill")
                    .font(.title3)
                    .foregroundStyle(Color(item.colors ?? .clear))
            }
            
            Spacer()
            
            Text("\(items.count)")
            
        }
    }
}
