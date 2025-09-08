//
//  ContentView.swift
//  Reminders
//
//  Created by sangam pokharel on 03/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddListView = false
    
    var body: some View {
        NavigationView {
            SideBarView(showAddListView: $showAddListView)
                .padding()
            Text("")
        }.sheet(isPresented: $showAddListView) {
            AddListView()
                .padding(.horizontal)
        }
    }
}



#Preview {
    ContentView()
}
